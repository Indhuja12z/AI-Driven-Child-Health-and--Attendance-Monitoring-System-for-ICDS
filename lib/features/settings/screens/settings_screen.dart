import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  String _language = 'English';
  String _fontSize = 'Medium';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(AppSizes.screenPadding),
                children: [
                  _profileCard(),
                  const SizedBox(height: AppSizes.lg),
                  _settingTile(
                    icon: Icons.dark_mode_outlined,
                    label: 'Dark mode',
                    trailing: Switch(
                      value: _darkMode,
                      activeColor: AppColors.primary,
                      onChanged: (v) => setState(() => _darkMode = v),
                    ),
                  ),
                  _settingTile(
                    icon: Icons.language_rounded,
                    label: 'Language',
                    trailing: _dropdownValue(_language, ['English', 'Tamil'],
                        (v) => setState(() => _language = v!)),
                  ),
                  _settingTile(
                    icon: Icons.format_size_rounded,
                    label: 'Font Size',
                    trailing: _dropdownValue(_fontSize,
                        ['Small', 'Medium', 'Large'],
                        (v) => setState(() => _fontSize = v!)),
                  ),
                  _settingTile(
                    icon: Icons.qr_code_rounded,
                    label: 'QR Download',
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        size: 14, color: AppColors.textHint),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Open a beneficiary → tap QR icon to download.'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: AppSizes.lg),
                  _settingTile(
                    icon: Icons.logout_rounded,
                    label: 'Logout',
                    iconColor: AppColors.danger,
                    labelColor: AppColors.danger,
                    onTap: () => _confirmLogout(),
                    trailing: const SizedBox.shrink(),
                  ),
                ],
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
              'Settings',
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

  Widget _profileCard() {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile edit coming soon'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
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
                  'P',
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
                      'Priya S.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Edit details',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  size: 14, color: AppColors.textHint),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingTile({
    required IconData icon,
    required String label,
    required Widget trailing,
    VoidCallback? onTap,
    Color? iconColor,
    Color? labelColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.md,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Icon(icon,
                    size: 20,
                    color: iconColor ?? AppColors.textPrimary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: labelColor ?? AppColors.textPrimary,
                    ),
                  ),
                ),
                trailing,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dropdownValue(
      String value, List<String> options, ValueChanged<String?> onChanged) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        isDense: true,
        icon: const Icon(Icons.keyboard_arrow_down_rounded,
            color: AppColors.textHint),
        items: options
            .map((o) => DropdownMenuItem(value: o, child: Text(o)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go(AppRoutes.login);
            },
            child: const Text('Logout',
                style: TextStyle(color: AppColors.danger)),
          ),
        ],
      ),
    );
  }
}