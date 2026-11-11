class Validators {
  /// 10-digit Indian mobile starting with 6–9
  static bool isValidPhone(String phone) =>
      RegExp(r'^[6-9]\d{9}$').hasMatch(phone);

  /// 12-digit Aadhaar (basic format; Verhoeff check omitted for demo)
  static bool isValidAadhaar(String aadhaar) =>
      RegExp(r'^\d{12}$').hasMatch(aadhaar);

  /// ABHA number format: 14 digits (XX-XXXX-XXXX-XXXX)
  static bool isValidAbha(String abha) {
    final cleaned = abha.replaceAll('-', '');
    return RegExp(r'^\d{14}$').hasMatch(cleaned);
  }

  /// OTP: 6 digits
  static bool isValidOtp(String otp) => RegExp(r'^\d{6}$').hasMatch(otp);

  /// Height sanity: 30–200 cm
  static bool isValidHeight(double cm) => cm >= 30 && cm <= 200;

  /// Weight sanity: 0.5–150 kg
  static bool isValidWeight(double kg) => kg >= 0.5 && kg <= 150;

  /// MUAC sanity: 5–25 cm
  static bool isValidMuac(double cm) => cm >= 5 && cm <= 25;
}