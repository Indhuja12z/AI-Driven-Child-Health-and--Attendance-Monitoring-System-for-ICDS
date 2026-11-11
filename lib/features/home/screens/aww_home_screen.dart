import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';
import '../../../data/local/isar_service.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/repositories/beneficiary_repo.dart';
import '../../../data/sync/sync_providers.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../data/models/home_visit.dart';
import 'package:isar_community/isar.dart';
class AwwHomeScreen extends ConsumerStatefulWidget {
  const AwwHomeScreen({super.key});

  @override
  ConsumerState<AwwHomeScreen> createState() => _AwwHomeScreenState();
}

class _AwwHomeScreenState extends ConsumerState<AwwHomeScreen> {
  bool _isOnline = true;
  bool _isSyncing = false;

  // Live data
  int _samChildren = 0;
  int _underweightChildren = 0;
  int _homeVisitsDue = 0;

  // Demo profile data
  final String _workerName = 'Priya S.';
  final String _placeName = 'AWC Madurai-04';
  final String _placeCode = 'TN-MDU-04';
  final bool _awcOpen = true;

  StreamSubscription? _connectivitySub;

  @override
  void initState() {
    super.initState();
    _loadStats();
    _initConnectivity();
  }

  @override
  void dispose() {
    _connectivitySub?.cancel();
    super.dispose();
  }

  Future<void> _initConnectivity() async {
    final connectivity = Connectivity();

    // Read initial state
    final initial = await connectivity.checkConnectivity();
    if (mounted) {
      setState(() {
        _isOnline = _isOnlineFrom(initial);
      });
    }

    // Listen for changes
    _connectivitySub =
        connectivity.onConnectivityChanged.listen((results) {
      if (mounted) {
        setState(() {
          _isOnline = _isOnlineFrom(results);
        });
      }
    });
  }

  bool _isOnlineFrom(List<ConnectivityResult> results) {
    return results.any((r) =>
        r == ConnectivityResult.wifi ||
        r == ConnectivityResult.mobile ||
        r == ConnectivityResult.ethernet);
  }

  Future<void> _loadStats() async {
    final repo = ref.read(beneficiaryRepoProvider);

    // Malnutrition counts across all children
    final children = <Beneficiary>[];
    for (final t in [
      BeneficiaryType.child0to6m,
      BeneficiaryType.child6mTo3y,
      BeneficiaryType.child3to6y,
    ]) {
      children.addAll(await repo.byType(t));
    }

    int sam = 0;
    int uw = 0;
    for (final c in children) {
      if (c.lastStatus == NutritionalStatus.sam) sam++;
      if (c.lastStatus == NutritionalStatus.underweight) uw++;
    }

    // Home visits due count
    final allVisits = await isarService.isar.homeVisits.where().findAll();
    final due = allVisits.where((v) => v.status.name == 'due').length;

    if (mounted) {
      setState(() {
        _samChildren = sam;
        _underweightChildren = uw;
        _homeVisitsDue = due;
      });
    }
  }

  void _onNavTap(AppTab tab) {
    switch (tab) {
      case AppTab.home:
        break;
      case AppTab.beneficiaries:
        context.go(AppRoutes.beneficiaries);
      case AppTab.growth:
        context.go(AppRoutes.growthMonitoring);
      case AppTab.thr:
        context.go(AppRoutes.thrCategories);
      case AppTab.report:
        context.go(AppRoutes.report);
    }
  }

  Future<void> _triggerSync() async {
    setState(() => _isSyncing = true);
    try {
      final syncService = ref.read(syncServiceProvider);
      final ok = await syncService.pushPendingItems();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ok ? 'Sync complete' : 'Sync failed — check logs'),
          backgroundColor: ok ? AppColors.success : AppColors.danger,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) setState(() => _isSyncing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: _loadStats,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.screenPadding,
                    vertical: AppSizes.md,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildTopBar(context),
                      const SizedBox(height: AppSizes.md),
                      _buildProfileCard(context),
                      const SizedBox(height: AppSizes.lg),
                      _buildSectionHeader('Daily Activity'),
                      const SizedBox(height: AppSizes.sm),
                      _buildDailyActivitySection(context),
                      const SizedBox(height: AppSizes.lg),
                      _buildSectionHeader('Attention'),
                      const SizedBox(height: AppSizes.sm),
                      _buildAttentionSection(context),
                      const SizedBox(height: AppSizes.lg),
                    ],
                  ),
                ),
              ),
            ),
            AppBottomNavBar(
              current: AppTab.home,
              onTap: _onNavTap,
              reportCount: 0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isSyncing ? null : _triggerSync,
        backgroundColor: AppColors.primary,
        child: _isSyncing
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.cloud_upload_rounded, color: Colors.white),
      ),
    );
  }

  // ---------------- Top Bar ----------------

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: (_isOnline ? AppColors.online : AppColors.offline)
                .withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(AppSizes.radiusPill),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _isOnline ? AppColors.online : AppColors.offline,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                _isOnline ? 'Online' : 'Offline',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _isOnline ? AppColors.online : AppColors.offline,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            _circleIcon(
              icon: Icons.notifications_none_rounded,
              onTap: () => context.push(AppRoutes.awwNotifications),
              showDot: true,
            ),
            const SizedBox(width: 8),
            _circleIcon(
              icon: Icons.settings_outlined,
              onTap: () => context.push(AppRoutes.settings),
            ),
          ],
        ),
      ],
    );
  }

  Widget _circleIcon({
    required IconData icon,
    required VoidCallback onTap,
    bool showDot = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.border),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon, size: 22, color: AppColors.textPrimary),
            if (showDot)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.danger,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ---------------- Profile Card ----------------

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
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
            child: Text(
              _workerName.isNotEmpty ? _workerName[0] : 'A',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _workerName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$_placeName · $_placeCode',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: (_awcOpen ? AppColors.success : AppColors.danger)
                        .withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'AWC Status: ${_awcOpen ? "Open" : "Closed"}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: _awcOpen ? AppColors.success : AppColors.danger,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Section Header ----------------

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }

  // ---------------- Daily Activity ----------------

  Widget _buildDailyActivitySection(BuildContext context) {
    return Column(
      children: [
        _taskCard(
          icon: Icons.how_to_reg_rounded,
          title: 'Mark Attendance',
          trailing: '9:00 AM',
          onTap: () => context.push(AppRoutes.attendanceCategories),
        ),
        const SizedBox(height: AppSizes.sm),
        _taskCard(
          icon: Icons.restaurant_rounded,
          title: 'HCM',
          trailing: '12:30 PM',
          onTap: () => context.push(AppRoutes.hcm),
        ),
      ],
    );
  }

  Widget _taskCard({
    required IconData icon,
    required String title,
    required String trailing,
    required VoidCallback onTap,
  }) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: InkWell(
        onTap: onTap,
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
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm + 2),
                ),
                child: Icon(icon, color: AppColors.primary, size: 22),
              ),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Text(
                trailing,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textHint,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: AppColors.textHint,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Attention ----------------

  Widget _buildAttentionSection(BuildContext context) {
    return Column(
      children: [
        _homeVisitsCard(context),
        const SizedBox(height: AppSizes.sm),
        _malnutritionCard(context),
        const SizedBox(height: AppSizes.sm),
        _provideThrCard(context),
      ],
    );
  }

  Widget _homeVisitsCard(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: InkWell(
        onTap: () async {
          await context.push(AppRoutes.homeVisits);
          if (mounted) _loadStats();
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
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm + 2),
                ),
                child: const Icon(
                  Icons.home_work_rounded,
                  color: AppColors.accent,
                  size: 22,
                ),
              ),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Home Visits',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Due: $_homeVisitsDue',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  await context.push(AppRoutes.homeVisits);
                  if (mounted) _loadStats();
                },
                child: const Text('View'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _malnutritionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.danger.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm + 2),
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.danger,
                  size: 22,
                ),
              ),
              const SizedBox(width: AppSizes.md),
              const Expanded(
                child: Text(
                  'Malnutrition Children',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          Row(
            children: [
              Expanded(
                  child: _metricBox(
                      _samChildren, 'SAM Children', AppColors.samRed)),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                  child: _metricBox(_underweightChildren, 'Underweight',
                      AppColors.mamOrange)),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () async {
                context.go(AppRoutes.report);
                if (mounted) _loadStats();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusPill),
                ),
              ),
              child: const Text('View Detail'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricBox(int count, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm + 2),
      ),
      child: Column(
        children: [
          Text(
            '$count',
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
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _provideThrCard(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: InkWell(
        onTap: () => context.push(AppRoutes.thrCategories),
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
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm + 2),
                ),
                child: const Icon(
                  Icons.rice_bowl_rounded,
                  color: AppColors.success,
                  size: 22,
                ),
              ),
              const SizedBox(width: AppSizes.md),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Provide THR',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Last provided: 15 days ago',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: AppColors.textHint,
              ),
            ],
          ),
        ),
      ),
    );
  }
}