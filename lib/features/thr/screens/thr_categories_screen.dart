import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';
import '../../../data/local/isar_service.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/repositories/beneficiary_repo.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import 'package:isar_community/isar.dart';
import '../../../data/models/thr_transaction.dart';
class ThrCategoriesScreen extends ConsumerStatefulWidget {
  const ThrCategoriesScreen({super.key});

  @override
  ConsumerState<ThrCategoriesScreen> createState() =>
      _ThrCategoriesScreenState();
}

class _ThrCategoriesScreenState extends ConsumerState<ThrCategoriesScreen> {
  Map<BeneficiaryType, (int provided, int total)> stats = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = ref.read(beneficiaryRepoProvider);
    final types = [
      BeneficiaryType.child6mTo3y,
      BeneficiaryType.child3to6y,
      BeneficiaryType.pregnant,
      BeneficiaryType.lactating,
    ];

    final map = <BeneficiaryType, (int, int)>{};
    for (final t in types) {
      final people = await repo.byType(t);
      int provided = 0;
      for (final p in people) {
        final recs = await isarService.isar.thrTransactions
            .where()
            .beneficiaryIdEqualTo(p.id)
            .findAll();
        if (recs.isNotEmpty) provided++;
      }
      map[t] = (provided, people.length);
    }
    if (mounted) setState(() => stats = map);
  }

  void _onNavTap(AppTab tab) {
    switch (tab) {
      case AppTab.home:
        context.go(AppRoutes.awwHome);
      case AppTab.beneficiaries:
        context.go(AppRoutes.beneficiaries);
      case AppTab.growth:
        context.go(AppRoutes.growthMonitoring);
      case AppTab.thr:
        break;
      case AppTab.report:
        context.go(AppRoutes.report);
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
            _topBar(context),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _load,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(AppSizes.screenPadding),
                  children: [
                    _row(Icons.child_care_rounded, 'Children 2-3 years',
                        BeneficiaryType.child6mTo3y),
                    const SizedBox(height: AppSizes.sm),
                    _row(Icons.face_rounded, 'Children 3-6 years',
                        BeneficiaryType.child3to6y),
                    const SizedBox(height: AppSizes.sm),
                    _row(Icons.pregnant_woman_rounded, 'Pregnant Women',
                        BeneficiaryType.pregnant),
                    const SizedBox(height: AppSizes.sm),
                    _row(Icons.child_care_rounded, 'Lactating Mother',
                        BeneficiaryType.lactating),
                    const SizedBox(height: AppSizes.lg),
                  ],
                ),
              ),
            ),
            AppBottomNavBar(
              current: AppTab.thr,
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
              'THR',
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

  Widget _row(IconData icon, String title, BeneficiaryType type) {
    final s = stats[type] ?? (0, 0);
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: InkWell(
        onTap: () async {
          await context.push('${AppRoutes.thrList}?type=${type.name}');
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
              Container(
                width: 44,
                height: 44,
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
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  '${s.$1}/${s.$2}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}