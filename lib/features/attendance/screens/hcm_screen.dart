import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';
import '../../../data/local/isar_service.dart';
import '../../../data/models/attendance.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/repositories/attendance_repo.dart';
import '../../../data/repositories/beneficiary_repo.dart';
import 'package:isar_community/isar.dart';

class HcmScreen extends ConsumerStatefulWidget {
  const HcmScreen({super.key});

  @override
  ConsumerState<HcmScreen> createState() => _HcmScreenState();
}

class _HcmScreenState extends ConsumerState<HcmScreen> {
  List<Beneficiary> children = [];
  Set<int> selected = {};
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
      BeneficiaryType.child6mTo3y,
      BeneficiaryType.child3to6y,
    ]) {
      all.addAll(await repo.byType(t));
    }

    final now = DateTime.now();
    final dayStart = DateTime(now.year, now.month, now.day);
    final dayEnd = dayStart.add(const Duration(days: 1));

    final preSelected = <int>{};
    for (final c in all) {
      final recs = await isarService.isar.attendances
          .where()
          .beneficiaryIdEqualTo(c.id)
          .findAll();
      final hasToday = recs.any((r) =>
          r.kind == AttendanceKind.hcm &&
          !r.markedAt.isBefore(dayStart) &&
          r.markedAt.isBefore(dayEnd));
      if (hasToday) preSelected.add(c.id);
    }

    if (mounted) {
      setState(() {
        children = all;
        selected = preSelected;
        loading = false;
      });
    }
  }

  Future<void> _verify() async {
    final repo = ref.read(attendanceRepoProvider);
    final now = DateTime.now();
    final dayStart = DateTime(now.year, now.month, now.day);
    final dayEnd = dayStart.add(const Duration(days: 1));

    for (final c in children) {
      if (!selected.contains(c.id)) continue;
      // Skip if already marked
      final recs = await isarService.isar.attendances
          .where()
          .beneficiaryIdEqualTo(c.id)
          .findAll();
      final hasToday = recs.any((r) =>
          r.kind == AttendanceKind.hcm &&
          !r.markedAt.isBefore(dayStart) &&
          r.markedAt.isBefore(dayEnd));
      if (hasToday) continue;

      await repo.mark(
        beneficiaryId: c.id,
        kind: AttendanceKind.hcm,
        verification: VerificationMethod.manual,
      );
    }

    if (mounted) {
      context.push(AppRoutes.hcmDone);
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = children.length;
    final count = selected.length;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            Expanded(
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(AppSizes.screenPadding),
                      child: Column(
                        children: [
                          _progressCard(count, total),
                          const SizedBox(height: AppSizes.lg),
                          ...children.map(_childRow),
                          const SizedBox(height: AppSizes.lg),
                        ],
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.md),
              child: ElevatedButton(
                onPressed: count > 0 ? _verify : null,
                child: Text('Verify ($count)'),
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
              'HCM',
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

  Widget _progressCard(int done, int total) {
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
              const Text('Hot Cooked Meal',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  )),
              Text('$done/$total',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  )),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 8,
              backgroundColor: AppColors.primary.withValues(alpha: 0.12),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _childRow(Beneficiary b) {
    final isSelected = selected.contains(b.id);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: InkWell(
          onTap: () {
            setState(() {
              if (isSelected) {
                selected.remove(b.id);
              } else {
                selected.add(b.id);
              }
            });
          },
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          child: Container(
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.border,
                width: isSelected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
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
                ),
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
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        b.gender.name[0].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.border,
                      width: 1.5,
                    ),
                  ),
                  child: isSelected
                      ? const Icon(Icons.check_rounded,
                          size: 16, color: Colors.white)
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}