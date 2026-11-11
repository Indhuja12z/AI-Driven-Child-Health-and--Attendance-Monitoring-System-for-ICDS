import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_router.dart';
import '../../../shared/widgets/auth_scaffold.dart';
import '../../../shared/widgets/app_logo.dart';
import '../../../shared/widgets/primary_button.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  static const _mockOtp = '123456';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onSignIn() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    if (_controller.text != _mockOtp) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect OTP. Use $_mockOtp for the demo.'),
          backgroundColor: AppColors.danger,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
        ),
      );
      return;
    }

    setState(() => _isLoading = false);
    context.go(AppRoutes.awwHome);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AuthScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.md,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 1),
              const Center(child: AppLogo(size: 100)),
              const SizedBox(height: AppSizes.md),
              Text(
                AppStrings.en['app_name']!,
                textAlign: TextAlign.center,
                style: textTheme.displayLarge?.copyWith(
                  color: AppColors.primaryDark,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 6),
              Center(
                child: Container(
                  width: 40,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.lg),
              Text(
                'Enter the 6-digit OTP sent to',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: AppColors.textHint,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '+91 ${widget.phone}',
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(flex: 1),
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 14,
                  fontWeight: FontWeight.w700,
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: '● ● ● ● ● ●',
                  counterText: '',
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Please enter the OTP';
                  if (v.length != 6) return 'OTP must be 6 digits';
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.lg),
              PrimaryButton(
                label: AppStrings.en['sign_in']!,
                trailingIcon: Icons.login_rounded,
                isLoading: _isLoading,
                onPressed: _onSignIn,
              ),
              const SizedBox(height: AppSizes.md),
              Center(
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('OTP resent (demo)'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: const Text('Resend OTP'),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}