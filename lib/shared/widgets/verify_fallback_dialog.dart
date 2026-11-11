import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../data/models/attendance.dart';
import '../../../data/models/beneficiary.dart';

class VerifyFallbackDialog extends StatefulWidget {
  final Beneficiary beneficiary;

  const VerifyFallbackDialog({super.key, required this.beneficiary});

  @override
  State<VerifyFallbackDialog> createState() => _VerifyFallbackDialogState();
}

class _VerifyFallbackDialogState extends State<VerifyFallbackDialog> {
  int _step = 0; // 0: choose, 1: OTP, 2: Manual
  final _otpCtrl = TextEditingController();
  String? _error;
  bool _sendingOtp = false;
  String? _generatedOtp;

  @override
  void dispose() {
    _otpCtrl.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    setState(() {
      _sendingOtp = true;
      _error = null;
    });

    // Mock OTP send — replace with real SMS API later
    await Future.delayed(const Duration(milliseconds: 800));
    _generatedOtp = '123456';

    setState(() {
      _sendingOtp = false;
      _step = 1;
    });
  }

  void _verifyOtp() {
    if (_otpCtrl.text != _generatedOtp) {
      setState(() => _error = 'Incorrect OTP. Try again.');
      return;
    }
    Navigator.of(context).pop(VerificationMethod.otp);
  }

  void _confirmManual() {
    Navigator.of(context).pop(VerificationMethod.manual);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: _step == 0
            ? _chooseStep()
            : _step == 1
                ? _otpStep()
                : _manualStep(),
      ),
    );
  }

  Widget _chooseStep() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.beneficiary.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'QR not available. Choose a verification method:',
          style: TextStyle(fontSize: 13, color: AppColors.textHint),
        ),
        const SizedBox(height: AppSizes.lg),

        _optionButton(
          icon: Icons.sms_rounded,
          label: 'Send OTP',
          sublabel: widget.beneficiary.phoneNumber ?? 'No phone registered',
          enabled: widget.beneficiary.phoneNumber != null && !_sendingOtp,
          onTap: _sendOtp,
        ),
        const SizedBox(height: AppSizes.sm),

        _optionButton(
          icon: Icons.photo_camera_rounded,
          label: 'Manual (view details)',
          sublabel: 'Use offline visual verification',
          enabled: true,
          onTap: () => setState(() => _step = 2),
        ),
        const SizedBox(height: AppSizes.lg),

        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Widget _optionButton({
    required IconData icon,
    required String label,
    required String sublabel,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return Material(
      color: enabled ? AppColors.primary.withValues(alpha: 0.08) : AppColors.border,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Row(
            children: [
              Icon(icon,
                  size: 22,
                  color: enabled ? AppColors.primary : AppColors.textHint),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color:
                            enabled ? AppColors.textPrimary : AppColors.textHint,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      sublabel,
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.textHint),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpStep() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Enter OTP',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Sent to ${widget.beneficiary.phoneNumber}',
          style: const TextStyle(fontSize: 13, color: AppColors.textHint),
        ),
        const SizedBox(height: AppSizes.lg),
        TextField(
          controller: _otpCtrl,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 6,
          style: const TextStyle(
              fontSize: 22, letterSpacing: 12, fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            hintText: '● ● ● ● ● ●',
            counterText: '',
            errorText: _error,
          ),
        ),
        const SizedBox(height: AppSizes.md),
        ElevatedButton(
          onPressed: _verifyOtp,
          child: const Text('Verify OTP'),
        ),
        const SizedBox(height: AppSizes.sm),
        TextButton(
          onPressed: () => setState(() {
            _step = 0;
            _error = null;
          }),
          child: const Text('Back'),
        ),
      ],
    );
  }

  Widget _manualStep() {
    final b = widget.beneficiary;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  b.name.isNotEmpty ? b.name[0].toUpperCase() : '?',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      b.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Gender: ${b.gender.name[0].toUpperCase()}',
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textHint),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.md),
        const Text(
          'Please visually confirm the beneficiary\'s face matches the avatar above.',
          style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
        const SizedBox(height: AppSizes.lg),
        ElevatedButton.icon(
          onPressed: _confirmManual,
          icon: const Icon(Icons.check_rounded),
          label: const Text('Confirm Identity'),
        ),
        const SizedBox(height: AppSizes.sm),
        TextButton(
          onPressed: () => setState(() => _step = 0),
          child: const Text('Back'),
        ),
      ],
    );
  }
}