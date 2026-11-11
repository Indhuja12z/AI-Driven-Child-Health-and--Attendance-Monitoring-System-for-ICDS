import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar_community/isar.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';
import '../../../data/local/isar_service.dart';
import '../../../data/models/attendance.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/repositories/attendance_repo.dart';
import '../../../data/repositories/beneficiary_repo.dart';

class MarkAttendanceScreen extends ConsumerStatefulWidget {
  final BeneficiaryType type;
  final AttendanceKind kind;
  const MarkAttendanceScreen({
    super.key,
    required this.type,
    required this.kind,
  });

  @override
  ConsumerState<MarkAttendanceScreen> createState() =>
      _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends ConsumerState<MarkAttendanceScreen> {
  List<Beneficiary> children = [];
  Set<int> markedToday = {};
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = ref.read(beneficiaryRepoProvider);
    final list = await repo.byType(widget.type);

    final now = DateTime.now();
    final dayStart = DateTime(now.year, now.month, now.day);
    final dayEnd = dayStart.add(const Duration(days: 1));

    final marked = <int>{};
    for (final c in list) {
      final recs = await isarService.isar.attendances
          .where()
          .beneficiaryIdEqualTo(c.id)
          .findAll();
      final hasToday = recs.any((r) =>
          r.kind == widget.kind &&
          !r.markedAt.isBefore(dayStart) &&
          r.markedAt.isBefore(dayEnd));
      if (hasToday) marked.add(c.id);
    }

    if (mounted) {
      setState(() {
        children = list;
        markedToday = marked;
        loading = false;
      });
    }
  }

  Future<void> _showManualVerificationPicker() async {
    // Step 1: Pick the child
    final chosen = await showModalBottomSheet<Beneficiary>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg)),
      ),
      builder: (_) => _beneficiaryPickerSheet(children),
    );
    if (chosen == null || !mounted) return;

    // Step 2: Show Manual Verification dialog (visual confirmation)
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => _ManualVerifyDialog(beneficiary: chosen),
    );
    if (confirmed != true || !mounted) return;

    // Step 3: Save with 'manual' verification method
    await ref.read(attendanceRepoProvider).mark(
          beneficiaryId: chosen.id,
          kind: widget.kind,
          verification: VerificationMethod.manual,
        );

    if (mounted) {
      setState(() => markedToday.add(chosen.id));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${chosen.name} — Manually verified'),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Widget _beneficiaryPickerSheet(List<Beneficiary> list) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(AppSizes.md),
            child: Text(
              'Select Beneficiary for Manual Verification',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenPadding),
              itemCount: list.length,
              separatorBuilder: (_, _) => const SizedBox(height: 6),
              itemBuilder: (_, i) {
                final b = list[i];
                final isDone = markedToday.contains(b.id);
                return ListTile(
                  enabled: !isDone,
                  onTap: isDone ? null : () => Navigator.of(context).pop(b),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: Text(
                      b.name.isNotEmpty ? b.name[0].toUpperCase() : '?',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  title: Text(b.name),
                  subtitle: Text(b.phoneNumber ?? 'No phone'),
                  trailing: isDone
                      ? const Icon(Icons.check_circle_rounded,
                          color: AppColors.success)
                      : null,
                );
              },
            ),
          ),
          const SizedBox(height: AppSizes.md),
        ],
      ),
    );
  }

  String _title() {
    switch (widget.type) {
      case BeneficiaryType.child6mTo3y:
        return 'Children 2-3 years';
      case BeneficiaryType.child3to6y:
        return 'Children 3-6 years';
      default:
        return 'Children';
    }
  }

  String _ageLabel(Beneficiary b) {
    if (b.dateOfBirth == null) return '—';
    final months = (DateTime.now().year - b.dateOfBirth!.year) * 12 +
        (DateTime.now().month - b.dateOfBirth!.month);
    if (months < 12) return '${months}M';
    final y = months ~/ 12;
    final r = months % 12;
    return r == 0 ? '${y}Y' : '${y}Y ${r}M';
  }

  @override
  Widget build(BuildContext context) {
    final pending =
        children.where((b) => !markedToday.contains(b.id)).toList();
    final done = children.where((b) => markedToday.contains(b.id)).toList();

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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    final scanned =
                                        await context.push<bool>(
                                      '${AppRoutes.qrScanner}?type=${widget.type.name}&kind=${widget.kind.name}',
                                    );
                                    if (scanned == true && mounted) {
                                      await _load();
                                    }
                                  },
                                  icon: const Icon(
                                      Icons.qr_code_scanner_rounded),
                                  label: const Text('Scan QR'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: _showManualVerificationPicker,
                                  icon: const Icon(Icons.photo_camera_rounded),
                                  label: const Text('QR not available'),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.radiusPill),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSizes.lg),

                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.success.withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.check_circle_rounded,
                                    size: 14, color: AppColors.success),
                                const SizedBox(width: 6),
                                Text(
                                  'Present Today (${markedToday.length}/${children.length})',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.success,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSizes.md),

                          ...pending.map((b) => _childRow(b, false)),
                          ...done.map((b) => _childRow(b, true)),
                          const SizedBox(height: AppSizes.lg),
                        ],
                      ),
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
          Expanded(
            child: Text(
              _title(),
              textAlign: TextAlign.center,
              style: const TextStyle(
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

  Widget _childRow(Beneficiary b, bool isMarked) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: isMarked
              ? AppColors.success.withValues(alpha: 0.04)
              : Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(
            color: isMarked
                ? AppColors.success.withValues(alpha: 0.4)
                : AppColors.border,
            width: isMarked ? 1.5 : 1,
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
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _ageLabel(b),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textHint,
                    ),
                  ),
                ],
              ),
            ),
            if (isMarked)
              const Icon(Icons.check_circle_rounded,
                  color: AppColors.success, size: 22)
            else
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_rounded,
                    size: 16, color: AppColors.primary),
              ),
          ],
        ),
      ),
    );
  }
}

/// A simple manual verification dialog showing the child's details
/// for visual confirmation.
class _ManualVerifyDialog extends StatelessWidget {
  final Beneficiary beneficiary;
  const _ManualVerifyDialog({required this.beneficiary});

  @override
  Widget build(BuildContext context) {
    final b = beneficiary;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      b.name.isNotEmpty ? b.name[0].toUpperCase() : '?',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
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
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Gender: ${b.gender.name[0].toUpperCase()}',
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textHint),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.md),
            const Text(
              'Please visually confirm the beneficiary\'s identity matches the details above.',
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
            const SizedBox(height: AppSizes.lg),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pop(true),
              icon: const Icon(Icons.check_rounded),
              label: const Text('Confirm Identity'),
            ),
            const SizedBox(height: AppSizes.sm),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}