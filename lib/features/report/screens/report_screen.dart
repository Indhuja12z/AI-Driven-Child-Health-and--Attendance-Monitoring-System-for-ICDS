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

class ReportScreen extends ConsumerStatefulWidget {
  const ReportScreen({super.key});

  @override
  ConsumerState<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<ReportScreen> {
  int samCount = 0;
  int mamCount = 0;
  int underweightCount = 0;
  int stuntedCount = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = ref.read(beneficiaryRepoProvider);
    final all = <Beneficiary>[];
    for (final t in [
      BeneficiaryType.child0to6m,
      BeneficiaryType.child6mTo3y,
      BeneficiaryType.child3to6y,
    ]) {
      all.addAll(await repo.byType(t));
    }

    int sam = 0, mam = 0, uw = 0, stunted = 0;
    for (final b in all) {
      switch (b.lastStatus) {
        case NutritionalStatus.sam:
          sam++;
          break;
        case NutritionalStatus.mam:
          mam++;
          break;
        case NutritionalStatus.underweight:
          uw++;
          break;
        case NutritionalStatus.stunted:
          stunted++;
          break;
        default:
          break;
      }
    }

    if (mounted) {
      setState(() {
        samCount = sam;
        mamCount = mam;
        underweightCount = uw;
        stuntedCount = stunted;
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
        context.go(AppRoutes.growthMonitoring);
      case AppTab.thr:
        context.go(AppRoutes.thrCategories);
      case AppTab.report:
        break;
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
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: _load,
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(AppSizes.screenPadding),
                        children: [
                          _dateFilter(),
                          const SizedBox(height: AppSizes.lg),
                          _sectionHeader('Malnutrition Children'),
                          const SizedBox(height: AppSizes.sm),
                          _metricRow(samCount, mamCount),
                          const SizedBox(height: AppSizes.md),
                          _viewDetailButton('View SAM + MAM Details'),
                          const SizedBox(height: AppSizes.lg),
                          _sectionHeader('Other Indicators'),
                          const SizedBox(height: AppSizes.sm),
                          _metricRow(underweightCount, stuntedCount,
                              label1: 'Underweight', label2: 'Stunted',
                              color1: AppColors.mamOrange,
                              color2: AppColors.accent),
                          const SizedBox(height: AppSizes.md),
                          _viewDetailButton('View Underweight + Stunted'),
                          const SizedBox(height: AppSizes.xl),
                          Center(
                            child: TextButton.icon(
                              onPressed: () => _showDownloadDialog(),
                              icon: const Icon(Icons.download_rounded),
                              label: const Text('Download Report'),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            AppBottomNavBar(
              current: AppTab.report,
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
              'Report',
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

  Widget _dateFilter() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today_rounded,
              size: 18, color: AppColors.primary),
          const SizedBox(width: 12),
          const Text(
            'Monthly',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down_rounded,
              color: AppColors.textHint),
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

  Widget _metricRow(int a, int b,
      {String label1 = 'SAM Children',
      String label2 = 'MAM Children',
      Color? color1,
      Color? color2}) {
    return Row(
      children: [
        Expanded(
            child: _metricBox(a, label1, color1 ?? AppColors.samRed)),
        const SizedBox(width: AppSizes.sm),
        Expanded(
            child: _metricBox(b, label2, color2 ?? AppColors.mamOrange)),
      ],
    );
  }

  Widget _metricBox(int count, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _viewDetailButton(String label) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => _showDetailDialog(),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusPill),
          ),
        ),
        child: Text(label),
      ),
    );
  }

  void _showDetailDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Malnutrition Details'),
        content: const Text(
          'Detailed list of children with SAM / MAM / Underweight / Stunted '
          'statuses. Full breakdown will be available after we add the child '
          'filter view.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showDownloadDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Download Report'),
        content: const Text(
          'A PDF report will be generated and saved to your device.\n\n'
          'Coming soon in the next update.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}