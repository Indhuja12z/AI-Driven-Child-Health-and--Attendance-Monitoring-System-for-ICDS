import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_router.dart';
import '../../../shared/widgets/auth_scaffold.dart';

class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AuthScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.screenPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSizes.md),

            // ---------------- Top Bar ----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _LanguageChip(onTap: () {}),
                _IconButtonSquare(
                  icon: Icons.help_outline_rounded,
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: AppSizes.xl),

            // ---------------- Heading ----------------
            Text(
              AppStrings.en['select_user_type']!,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                fontSize: 24,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

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

            const SizedBox(height: AppSizes.xl),

            // ---------------- Role Cards ----------------
            _RoleCard(
              icon: Icons.local_hospital_rounded,
              label: AppStrings.en['aww']!,
              subtitle: 'Login as an Anganwadi Worker',
              onTap: () => context.go(AppRoutes.phoneLogin),
            ),
            const SizedBox(height: AppSizes.md),

            _RoleCard(
              icon: Icons.admin_panel_settings_rounded,
              label: AppStrings.en['supervisor']!,
              subtitle: 'Supervisor, CDPO or DPO access',
              onTap: ()  => context.go(AppRoutes.supervisorHome),
            ),
            const SizedBox(height: AppSizes.md),

            _RoleCard(
              icon: Icons.family_restroom_rounded,
              label: AppStrings.en['beneficiary']!,
              subtitle: 'Parent or guardian login',
              onTap: () => context.go(AppRoutes.parentHome),
            ),

            const Spacer(),

            // ---------------- Footer ----------------
            Text(
              'v1.0.0 · Made with care',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 12,
                color: AppColors.textHint,
              ),
            ),

            const SizedBox(height: AppSizes.md),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// Local widgets
// ============================================================

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.05),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon in gradient square
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withValues(alpha: 0.15),
                      AppColors.primary.withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: AppSizes.iconLg,
                ),
              ),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  final VoidCallback onTap;
  const _LanguageChip({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusPill),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusPill),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.md,
            vertical: AppSizes.sm,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusPill),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.language_rounded,
                size: AppSizes.iconSm,
                color: AppColors.textPrimary,
              ),
              const SizedBox(width: AppSizes.sm),
              const Text(
                'English',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 16,
                color: AppColors.textHint,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconButtonSquare extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _IconButtonSquare({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            border: Border.all(color: AppColors.border),
          ),
          child: Icon(
            icon,
            size: AppSizes.iconMd,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}