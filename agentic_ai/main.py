import os
import pickle
from datetime import datetime
from typing import List, Optional

import pandas as pd
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from tabpfn.model_loading import load_fitted_tabpfn_model

# ---- Optional: silence TabPFN browser auth if token set via env ----
os.environ.setdefault("TABPFN_NO_BROWSER", "1")

# ---- Load model ----
MODEL_PATH = "models/stunting_model.tabpfn_fit"
print(f"Loading model from {MODEL_PATH}...")
model = load_fitted_tabpfn_model(MODEL_PATH, device="cpu")
print("Model loaded.")

app = FastAPI(title="Little Steps AI Agent")

# Allow Flutter app to call from any origin (dev only)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# ---- Schemas ----
class GrowthData(BaseModel):
    child_id: int
    age_months: float
    weight_kg: float
    height_cm: float
    gender: str  # "M" or "F"
    health_issues: List[str] = []

class Action(BaseModel):
    type: str               # "schedule_home_visit" | "notify_clinic"
    priority: str           # "high" | "moderate" | "low"
    due_within_days: int
    reason: str

class PredictionResponse(BaseModel):
    risk_probability: float
    severity: str
    recommended_actions: List[Action]
    explanation: str


# ---- Agentic Rules ----
def assign_severity(prob: float, health_issues: List[str]) -> str:
    """Convert probability + health context into a severity level."""
    if prob >= 0.80:
        severity = "high"
    elif prob >= 0.50:
        severity = "moderate"
    else:
        severity = "low"

    # Upgrade priority if the child has underlying health issues
    if health_issues:
        if severity == "low":
            severity = "moderate"
        elif severity == "moderate":
            severity = "high"

    return severity


def build_actions(severity: str, prob: float, health_issues: List[str]) -> List[Action]:
    """Generate recommended actions based on severity."""
    actions: List[Action] = []

    if severity == "high":
        actions.append(Action(
            type="schedule_home_visit",
            priority="high",
            due_within_days=0,  # Today
            reason=f"High malnutrition risk ({prob:.0%})"
                   + (f" + health issues: {', '.join(health_issues)}" if health_issues else ""),
        ))
        if health_issues:
            actions.append(Action(
                type="notify_clinic",
                priority="high",
                due_within_days=0,
                reason="High risk with underlying health conditions — refer to clinic",
            ))
    elif severity == "moderate":
        actions.append(Action(
            type="schedule_home_visit",
            priority="moderate",
            due_within_days=3,
            reason=f"Moderate risk ({prob:.0%})",
        ))
    else:
        actions.append(Action(
            type="schedule_home_visit",
            priority="low",
            due_within_days=7,
            reason="Routine follow-up",
        ))

    return actions


# ---- Endpoints ----
@app.get("/")
def health():
    return {"status": "ok"}


@app.post("/predict", response_model=PredictionResponse)
def predict(data: GrowthData):
    gender_num = 1 if data.gender.upper() == "M" else 0

    features = pd.DataFrame([{
        "age_months": data.age_months,
        "weight_kg": data.weight_kg,
        "height_cm": data.height_cm,
        "gender_num": gender_num,
    }])

    # TabPFN prediction
    prob = float(model.predict_proba(features)[0][1])

    # Agent rules
    severity = assign_severity(prob, data.health_issues)
    actions = build_actions(severity, prob, data.health_issues)

    # Explanation
    explanation = f"Risk probability {prob:.2f}. Severity classified as {severity}."
    if data.health_issues:
        explanation += f" Health conditions flagged: {', '.join(data.health_issues)}."

    return PredictionResponse(
        risk_probability=prob,
        severity=severity,
        recommended_actions=actions,
        explanation=explanation,
    )