import 'package:flutter/material.dart';

class AppColors {
  // ============================================================
  // PRIMARY BRAND COLORS
  // ============================================================

  /// Vibrant Blue — logo, primary CTA buttons, highlighted text
  static const Color primary = Color(0xFF0F62FE);
  static const Color primaryDark = Color(0xFF0055FF);

  /// Dark Navy — dark section backgrounds, footers
  static const Color navy = Color(0xFF0A0F1D);
  static const Color navyDeep = Color(0xFF080C16);

  /// Cyan / Bright Blue accent — separator lines, highlights
  static const Color accent = Color(0xFF00C6FF);

  // ============================================================
  // NEUTRAL BACKGROUNDS & CONTAINERS
  // ============================================================

  /// Off-white / light grey — primary screen background
  static const Color background = Color(0xFFF8F9FA);
  static const Color backgroundAlt = Color(0xFFF4F6F9);

  /// White — cards, headers, button text
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceAlt = Color(0xFFF4F6F9);

  // ============================================================
  // TEXT & ICON COLORS
  // ============================================================

  /// Dark charcoal — main text, headers
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF4A5568); // derived mid-grey
  static const Color textHint = Color(0xFF94A3B8);

  /// Muted blue-grey — secondary text on dark backgrounds
  static const Color textOnDark = Color(0xFF94A3B8);
  static const Color textOnDarkMuted = Color(0xFF8A99AD);

  /// White text (for dark sections / primary buttons)
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ============================================================
  // BORDERS & SUBTLE ACCENTS
  // ============================================================

  /// Light grey border — card outlines, button outlines
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderAlt = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFEEEEEE);

  /// Dark grid lines — visible in dark sections
  static const Color gridLine = Color(0xFF1E293B);
  static const Color gridLineAlt = Color(0xFF161F33);

  // ============================================================
  // SEMANTIC / STATUS COLORS
  // ============================================================

  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF9A825);
  static const Color danger = Color(0xFFC62828);

  static const Color online = Color(0xFF2E7D32);
  static const Color offline = Color(0xFF757575);

  static const Color samRed = Color(0xFFC62828);
  static const Color mamOrange = Color(0xFFEF6C00);
}