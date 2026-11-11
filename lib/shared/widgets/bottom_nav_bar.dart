import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

enum AppTab { home, beneficiaries, growth, thr, report }

class AppBottomNavBar extends StatelessWidget {
  final AppTab current;
  final ValueChanged<AppTab> onTap;
  final int reportCount;

  const AppBottomNavBar({
    super.key,
    required this.current,
    required this.onTap,
    this.reportCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.bottomNavHeight,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavItem(
              icon: Icons.home_rounded,
              label: 'Home',
              active: current == AppTab.home,
              onTap: () => onTap(AppTab.home),
            ),
            _NavItem(
              icon: Icons.groups_rounded,
              label: 'Beneficiaries',
              active: current == AppTab.beneficiaries,
              onTap: () => onTap(AppTab.beneficiaries),
            ),
            _NavItem(
              icon: Icons.monitor_weight_rounded,
              label: 'GM',
              active: current == AppTab.growth,
              onTap: () => onTap(AppTab.growth),
            ),
            _NavItem(
              icon: Icons.rice_bowl_rounded,
              label: 'THR',
              active: current == AppTab.thr,
              onTap: () => onTap(AppTab.thr),
            ),
            _NavItem(
              icon: Icons.bar_chart_rounded,
              label: 'Report',
              active: current == AppTab.report,
              onTap: () => onTap(AppTab.report),
              badgeCount: reportCount,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;
  final int badgeCount;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.primary : AppColors.textHint;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 40,
                  height: 30,
                  alignment: Alignment.center,
                  child: Icon(icon, size: 22, color: color),
                ),
                if (badgeCount > 0)
                  Positioned(
                    right: 2,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: AppColors.danger,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        badgeCount > 9 ? '9+' : '$badgeCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}