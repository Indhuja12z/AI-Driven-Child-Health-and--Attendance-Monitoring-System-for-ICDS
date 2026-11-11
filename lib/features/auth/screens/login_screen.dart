import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_router.dart';
import '../../../shared/widgets/auth_scaffold.dart';
import '../../../shared/widgets/app_logo.dart';
import '../../../shared/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AuthScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 2),

            // ---- Logo ----
            const Center(child: AppLogo(size: 120)),

            const SizedBox(height: AppSizes.lg),

            // ---- Title ----
            Text(
              AppStrings.en['app_name']!,
              textAlign: TextAlign.center,
              style: textTheme.displayLarge?.copyWith(
                color: AppColors.primaryDark,
                fontSize: 28,
                letterSpacing: -0.5,
              ),
            ),

            const SizedBox(height: 6),

            // ---- Accent divider ----
            Center(
              child: Container(
                width: 60,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),

            const SizedBox(height: AppSizes.md),

            // ---- Tagline ----
            Text(
              AppStrings.en['tagline']!,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: AppColors.textHint,
                height: 1.5,
              ),
            ),

            const Spacer(flex: 2),

            // ---- Illustration ----
        // ---- Illustration (square, no crop) ----
Center(
  child: AspectRatio(
    aspectRatio: 1, // 1:1
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        child: Image.asset(
          'assets/images/illustration.png',
          fit: BoxFit.contain, // ← shows the whole image
        ),
      ),
    ),
  ),
),

            const Spacer(flex: 1),

            // ---- Login button ----
            PrimaryButton(
              label: AppStrings.en['login']!,
              trailingIcon: Icons.arrow_forward_rounded,
              onPressed: () => context.go(AppRoutes.roleSelect),
            ),

            const SizedBox(height: AppSizes.md),
          ],
        ),
      ),
    );
  }
}