import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';
import '../../../data/local/isar_service.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/models/growth_record.dart';
import '../../../data/repositories/beneficiary_repo.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import 'package:isar_community/isar.dart';

class GrowthMonitoringScreen extends ConsumerStatefulWidget {
  const GrowthMonitoringScreen({super.key});

  @override
  ConsumerState<GrowthMonitoringScreen> createState() =>
      _GrowthMonitoringScreenState();
}

class _GrowthMonitoringScreenState
    extends ConsumerState<GrowthMonitoringScreen> {
  List<Beneficiary> pending = [];
  List<Beneficiary> done = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = ref.read(beneficiaryRepoProvider);

    // All children under 6y
    final all = <Beneficiary>[];
    for (final t in [
      BeneficiaryType.child0to6m,
      BeneficiaryType.child6mTo3y,
      BeneficiaryType.child3to6y,
    ]) {
      all.addAll(await repo.byType(t));
    }

    // Determine who has a growth record this month
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month, 1);
    final monthEnd = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

    final pendingList = <Beneficiary>[];
    final doneList = <Beneficiary>[];

    for (final b in all) {
      final recs = await isarService.isar.growthRecords
          .where()
          .beneficiaryIdEqualTo(b.id)
          .findAll();
      if (recs.isEmpty) {
        pendingList.add(b);
      } else {
        doneList.add(b);
      }
    }

    if (mounted) {
      setState(() {
        pending = pendingList;
        done = doneList;
        loading = false;
      });
    }
  }

  void _onNavTap(AppTab tab) {
    switch (tab) {
      case AppTab.home:
        context.go(AppRoutes.awwHome);
      case AppTab.beneficiaries:
        context.go(AppRoutes.beneficiaries);
      case AppTab.growth:
        break;
      case AppTab.thr:
        context.go(AppRoutes.thrCategories);
      case AppTab.report:
        context.go(AppRoutes.report);
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = pending.length + done.length;
    final doneCount = done.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _topBar(context),
            Expanded(
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: _load,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.screenPadding,
                          vertical: AppSizes.md,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _progressHeader(doneCount, total),
                            const SizedBox(height: AppSizes.lg),
                            if (pending.isNotEmpty) ...[
                              _sectionHeader(
                                'Pending',
                                icon: Icons.cancel_rounded,
                                color: AppColors.danger,
                                count: pending.length,
                              ),
                              const SizedBox(height: AppSizes.sm),
                              ...pending.map(_pendingRow),
                              const SizedBox(height: AppSizes.lg),
                            ],
                            if (done.isNotEmpty) ...[
                              _sectionHeader(
                                'Done',
                                icon: Icons.check_circle_rounded,
                                color: AppColors.success,
                                count: done.length,
                              ),
                              const SizedBox(height: AppSizes.sm),
                              ...done.map(_doneRow),
                            ],
                            const SizedBox(height: AppSizes.lg),
                          ],
                        ),
                      ),
                    ),
            ),
            AppBottomNavBar(
              current: AppTab.growth,
              onTap: _onNavTap,
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
            onPressed: () => context.go(AppRoutes.awwHome),
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          const Expanded(
            child: Text(
              'Growth Monitoring',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
    );
  }

  Widget _progressHeader(int done, int total) {
    final ratio = total == 0 ? 0.0 : done / total;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'This Month',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '$done/$total',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 8,
              backgroundColor: AppColors.primary.withValues(alpha: 0.12),
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title,
      {required IconData icon, required Color color, required int count}) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const Spacer(),
        Text(
          '$count',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _pendingRow(Beneficiary b) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: InkWell(
          onTap: () async {
            await context.push('${AppRoutes.heightWeight}/${b.id}');
            _load();
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
                _avatar(b),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        b.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Gender: ${b.gender.name[0].toUpperCase()}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.danger.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close_rounded,
                      size: 16, color: AppColors.danger),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _doneRow(Beneficiary b) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: InkWell(
          onTap: () => context.push('${AppRoutes.beneficiaryDetail}/${b.id}'),
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          child: Container(
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                _avatar(b),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        b.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Gender: ${b.gender.name[0].toUpperCase()}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check_rounded,
                      size: 16, color: AppColors.success),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _avatar(Beneficiary b) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.10),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        b.name.isNotEmpty ? b.name[0].toUpperCase() : '?',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
      ),
    );
  }
}