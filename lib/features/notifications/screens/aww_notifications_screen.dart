import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class AwwNotificationsScreen extends StatefulWidget {
  const AwwNotificationsScreen({super.key});

  @override
  State<AwwNotificationsScreen> createState() => _AwwNotificationsScreenState();
}

class _AwwNotificationsScreenState extends State<AwwNotificationsScreen> {
  int _tab = 0;
  final tabs = ['Important', 'Pending', 'Update'];

  final List<Map<String, dynamic>> _allNotifications = [
    {
      'type': 'attention',
      'title': 'Attention!',
      'message': '3 children are underweight this month. Please schedule home visits.',
      'category': 'Important',
    },
    {
      'type': 'attention',
      'title': 'Attention!',
      'message': 'SAM detected in Aarav Kumar. Immediate follow-up needed.',
      'category': 'Important',
    },
    {
      'type': 'info',
      'title': 'Reminder',
      'message': '5 HCM records pending verification for today.',
      'category': 'Pending',
    },
    {
      'type': 'info',
      'title': 'Update',
      'message': 'New WHO growth standards applied. No action required.',
      'category': 'Update',
    },
  ];

  List<Map<String, dynamic>> get _filtered =>
      _allNotifications.where((n) => n['category'] == tabs[_tab]).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            _filterTabs(),
            Expanded(
              child: _filtered.isEmpty
                  ? _emptyState()
                  : ListView.separated(
                      padding: const EdgeInsets.all(AppSizes.screenPadding),
                      itemCount: _filtered.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(height: AppSizes.sm),
                      itemBuilder: (_, i) => _notificationCard(_filtered[i]),
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

  Widget _filterTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.screenPadding,
        vertical: AppSizes.sm,
      ),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final active = _tab == i;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _tab = i),
              child: Container(
                margin: EdgeInsets.only(right: i < tabs.length - 1 ? 8 : 0),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: active ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusPill),
                  border: Border.all(
                    color: active ? AppColors.primary : AppColors.border,
                  ),
                ),
                child: Text(
                  tabs[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: active ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_rounded,
              size: 60, color: AppColors.textHint.withValues(alpha: 0.5)),
          const SizedBox(height: 12),
          Text(
            'No ${tabs[_tab].toLowerCase()} notifications',
            style: const TextStyle(color: AppColors.textHint, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _notificationCard(Map<String, dynamic> n) {
    final isAttention = n['type'] == 'attention';
    final color = isAttention ? AppColors.danger : AppColors.primary;
    final bgColor = isAttention ? AppColors.danger : AppColors.primary;

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
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: bgColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  n['title'],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
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