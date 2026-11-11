import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';

class SupervisorHomeScreen extends StatelessWidget {
  const SupervisorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _topBar(context),
              const SizedBox(height: AppSizes.md),
              _profileCard(),
              const SizedBox(height: AppSizes.lg),
              _sectionHeader('This Block'),
              const SizedBox(height: AppSizes.sm),
              _statGrid(),
              const SizedBox(height: AppSizes.lg),
              _sectionHeader('Centers Overview'),
              const SizedBox(height: AppSizes.sm),
              _centerRow('AWC Madurai-04', 45, 2, 5),
              const SizedBox(height: AppSizes.sm),
              _centerRow('AWC Madurai-05', 38, 0, 3),
              const SizedBox(height: AppSizes.sm),
              _centerRow('AWC Madurai-06', 52, 4, 7),
              const SizedBox(height: AppSizes.lg),
              ElevatedButton.icon(
                onPressed: () => context.push(AppRoutes.auditDashboard),
                icon: const Icon(Icons.verified_user_rounded),
                label: const Text('Audit Dashboard'),
              ),
              const SizedBox(height: AppSizes.lg),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => context.go(AppRoutes.login),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        const Expanded(
          child: Text(
            'Supervisor',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(width: 48),
      ],
    );
  }

  Widget _profileCard() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              'R',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: AppSizes.md),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ravi Kumar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'CDPO · Madurai East',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textHint,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _statGrid() {
    return Row(
      children: [
        Expanded(
            child: _statBox('135', 'Beneficiaries', AppColors.primary)),
        const SizedBox(width: AppSizes.sm),
        Expanded(child: _statBox('6', 'SAM/MAM', AppColors.samRed)),
        const SizedBox(width: AppSizes.sm),
        Expanded(child: _statBox('15', 'THR Pending', AppColors.mamOrange)),
      ],
    );
  }

  Widget _statBox(String count, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _centerRow(String name, int total, int sam, int thr) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _miniStat('$total', 'Total'),
              const SizedBox(width: 16),
              _miniStat('$sam', 'SAM', color: AppColors.samRed),
              const SizedBox(width: 16),
              _miniStat('$thr', 'THR Due', color: AppColors.mamOrange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniStat(String val, String label, {Color? color}) {
    return Row(
      children: [
        Text(
          val,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: color ?? AppColors.textPrimary,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textHint,
          ),
        ),
      ],
    );
  }
}