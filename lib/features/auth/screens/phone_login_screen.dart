import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/utils/validators.dart';
import '../../../shared/widgets/auth_scaffold.dart';
import '../../../shared/widgets/app_logo.dart';
import '../../../shared/widgets/primary_button.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSendOtp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 600));

    if (!mounted) return;
    setState(() => _isLoading = false);

    context.go('${AppRoutes.otp}?phone=${_controller.text}');
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
                'Enter your registered phone number\nto receive a one-time password',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: AppColors.textHint,
                  height: 1.5,
                ),
              ),
              const Spacer(flex: 1),
              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: const TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: AppStrings.en['phone_no'],
                  counterText: '',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 8, right: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 8),
                        Icon(Icons.phone_rounded,
                            color: AppColors.textHint, size: 20),
                        SizedBox(width: 4),
                      ],
                    ),
                  ),
                  prefixText: '+91  ',
                  prefixStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!Validators.isValidPhone(v)) {
                    return 'Enter a valid 10-digit mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.lg),
              PrimaryButton(
                label: AppStrings.en['send_otp']!,
                trailingIcon: Icons.arrow_forward_rounded,
                isLoading: _isLoading,
                onPressed: _onSendOtp,
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}