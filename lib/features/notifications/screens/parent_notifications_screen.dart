import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class ParentNotificationsScreen extends StatelessWidget {
  const ParentNotificationsScreen({super.key});

  final List<Map<String, dynamic>> notifications = const [
    {
      'type': 'attention',
      'title': 'Attention!',
      'message': 'Please visit the Anganwadi Centre for your child\'s monthly checkup.',
    },
    {
      'type': 'congrats',
      'title': 'Congratulations!',
      'message': 'Your child got taller by 1.2 cm this month. Keep up the good work!',
    },
    {
      'type': 'info',
      'title': 'Reminder',
      'message': 'Vitamin A dose is due next week.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSizes.screenPadding),
                itemCount: notifications.length,
                separatorBuilder: (_, _) => const SizedBox(height: AppSizes.sm),
                itemBuilder: (_, i) => _card(notifications[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.sm,
        vertical: AppSizes.sm,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          const Expanded(
            child: Text(
              'Notifications',
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
      ),
    );
  }

  Widget _card(Map<String, dynamic> n) {
    final isAttention = n['type'] == 'attention';
    final isCongrats = n['type'] == 'congrats';
    final color = isAttention
        ? AppColors.danger
        : isCongrats
            ? AppColors.success
            : AppColors.primary;
    final icon = isAttention
        ? Icons.warning_amber_rounded
        : isCongrats
            ? Icons.celebration_rounded
            : Icons.info_rounded;

    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 6),
              Text(
                n['title'],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
              const Spacer(),
              Icon(Icons.smart_toy_rounded,
                  size: 18, color: AppColors.textHint.withValues(alpha: 0.7)),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            n['message'],
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}