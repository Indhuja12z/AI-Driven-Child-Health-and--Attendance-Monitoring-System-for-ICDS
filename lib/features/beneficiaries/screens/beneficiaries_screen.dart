import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/repositories/beneficiary_repo.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';

class BeneficiariesScreen extends ConsumerStatefulWidget {
  const BeneficiariesScreen({super.key});

  @override
  ConsumerState<BeneficiariesScreen> createState() =>
      _BeneficiariesScreenState();
}

class _BeneficiariesScreenState extends ConsumerState<BeneficiariesScreen> {
  Map<BeneficiaryType, int> counts = {};

  @override
  void initState() {
    super.initState();
    _loadCounts();
  }

  Future<void> _loadCounts() async {
    final repo = ref.read(beneficiaryRepoProvider);
    final map = <BeneficiaryType, int>{};
    for (final t in BeneficiaryType.values) {
      map[t] = (await repo.byType(t)).length;
    }
    if (mounted) setState(() => counts = map);
  }

  void _onNavTap(AppTab tab) {
    switch (tab) {
      case AppTab.home:
        context.go(AppRoutes.awwHome);
      case AppTab.beneficiaries:
        break;
      case AppTab.growth:
        context.go(AppRoutes.growthMonitoring);
      case AppTab.thr:
        context.go(AppRoutes.thrCategories);
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenPadding,
                  vertical: AppSizes.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _sectionHeader('Children', showAdd: true),
                    const SizedBox(height: AppSizes.sm),
                    _categoryCard(
                      icon: FontAwesomeIcons.baby,
                      title: 'Children (0 - 6 Months)',
                      count: counts[BeneficiaryType.child0to6m] ?? 0,
                      type: BeneficiaryType.child0to6m,
                    ),
                    const SizedBox(height: AppSizes.sm),
                    _categoryCard(
                      icon: FontAwesomeIcons.child,
                      title: 'Children (6 Mon - 3 Years)',
                      count: counts[BeneficiaryType.child6mTo3y] ?? 0,
                      type: BeneficiaryType.child6mTo3y,
                    ),
                    const SizedBox(height: AppSizes.sm),
                    _categoryCard(
                      icon: FontAwesomeIcons.children,
                      title: 'Children (3 - 6 Years)',
                      count: counts[BeneficiaryType.child3to6y] ?? 0,
                      type: BeneficiaryType.child3to6y,
                    ),
                    const SizedBox(height: AppSizes.lg),
                    _sectionHeader('Adults'),
                    const SizedBox(height: AppSizes.sm),
                    _categoryCard(
                      icon: FontAwesomeIcons.personPregnant,
                      title: 'Pregnant Women',
                      count: counts[BeneficiaryType.pregnant] ?? 0,
                      type: BeneficiaryType.pregnant,
                    ),
                    const SizedBox(height: AppSizes.sm),
                    _categoryCard(
                      icon: FontAwesomeIcons.personBreastfeeding,
                      title: 'Lactating Mother',
                      count: counts[BeneficiaryType.lactating] ?? 0,
                      type: BeneficiaryType.lactating,
                    ),
                    const SizedBox(height: AppSizes.lg),
                  ],
                ),
              ),
            ),
            AppBottomNavBar(
              current: AppTab.beneficiaries,
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
              'Beneficiaries',
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

  Widget _sectionHeader(String title, {bool showAdd = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        if (showAdd)
          GestureDetector(
            onTap: () => context.push(AppRoutes.addBeneficiary),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Icon(Icons.add_rounded,
                  color: Colors.white, size: 18),
            ),
          ),
      ],
    );
  }

  Widget _categoryCard({
    required IconData icon,
    required String title,
    required int count,
    required BeneficiaryType type,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: InkWell(
        onTap: () => context.push(
          '${AppRoutes.childrenList}?type=${type.name}',
        ),
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
                child: Center(
                  child: FaIcon(
                    icon,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
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
                  '$count',
                  style: const TextStyle(
                    fontSize: 13,
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