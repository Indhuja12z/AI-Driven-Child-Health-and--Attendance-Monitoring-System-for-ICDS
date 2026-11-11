# Little Steps Tracker

> **Every Little Step, A Better Tomorrow!**

An **offline-first Anganwadi management app** designed as a comprehensive, AI-powered alternative to Poshan Tracker. Built with Flutter, Isar, Firebase, and TabPFN.

Built for Anganwadi Workers (AWWs) in rural India who face **low connectivity**, **limited device storage**, and **high beneficiary volume**.

---

## Key Features

### Core Operations
- **Offline-first** — Works 100% without internet (Isar local database)
- **AWC status toggle** — Daily open/closed tracking
- **Daily activity logging** — Snacks, Hot Cooked Meal (HCM), Pre-School Education (PSE)
- **Automated home visit scheduler** — Based on critical development windows

### Beneficiary Management
- **Lifecycle profiles** — Pregnant, lactating, children (0–6y), adolescent girls
- **WHO Growth Standards** — Accurate Z-scores (WAZ, HAZ, WHZ, BMI-for-Age)
- **National ID integration** — Aadhaar + ABHA linking & verification

### QR-Based Verification (Fallback System)
- **Primary** — Instant QR scan
- **Fallback 1** — OTP to registered mobile (online)
- **Fallback 2** — Manual visual verification with photo (offline)
- **Strict audit logging** — Every transaction logs the verification method used

### Agentic AI (TabPFN)
- **Malnutrition prediction** — TabPFN ML model trained on 40,000+ child records
- **Priority-based scheduling** — Home visits auto-created with severity levels:
  - 🔴 **High** — SAM detected or health issues present → due today
  - 🟠 **Moderate** — MAM detected → due within 3 days
  - 🟢 **Low** — Routine follow-up → due within 7 days
- **Clinic referral** — Auto-flags severe cases for NRC/PHC referral (with AWW approval)

### Cloud Sync
- **Priority queue** — P1 (critical) → P2 (important) → P3 (low)
- **Auto-sync** — Triggered on network availability (30s polling + connectivity stream)
- **Batch writes** — Efficient Firestore uploads
- **Conflict resolution** — Merge-based updates

### Role-Based Access
| Role | Access |
|------|--------|
| **AWW** | Full app, daily operations |
| **Supervisor/CDPO** | Center analytics, audit dashboard |
| **Parent** | Child growth view, notifications |

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | Flutter 3.41.9 · Dart 3.9 |
| **State Management** | Riverpod |
| **Routing** | GoRouter |
| **Local Database** | Isar Community |
| **Cloud** | Firebase Firestore + Storage |
| **Auth** | Firebase Phone Auth (with demo mock) |
| **AI/ML** | TabPFN (Python FastAPI) |
| **QR** | qr_flutter · mobile_scanner |
| **Voice** | flutter_tts · speech_to_text |
| **Charts** | Custom widgets |

---

### Data Flow

1. **AWW logs data** → Saved instantly to **Isar** (offline-first)
2. **Sync queue** → Record added with priority (P1/P2/P3)
3. **Network available** → Auto-sync pushes to **Firestore** in priority order
4. **AI prediction** → Growth record triggers TabPFN → returns risk + actions
5. **Agentic rules** → Auto-creates HomeVisit / AwwAlert based on severity
6. **Supervisor dashboard** → Reads aggregated data from Firestore

---

##  Getting Started

### Prerequisites
- Flutter SDK 3.41.9 or higher
- Android Studio or VS Code with Flutter plugin
- A Firebase project (for cloud sync)

### 1. Clone the Repository

```bash
git clone https://github.com/Indhuja12z/AI-Driven-Child-Health-and--Attendance-Monitoring-System-for-ICDS.git
cd little-steps-tracker
```
### 2.Install Dependencies
flutter pub get

### 3.Firebase Setup

Create a Firebase project at console.firebase.google.com

Enable Firestore and Phone Authentication

Register your Android app with your package name

Download google-services.json → place in android/app/

Run flutterfire configure to generate lib/firebase_options.dart

### 4.Run the App
flutter run


