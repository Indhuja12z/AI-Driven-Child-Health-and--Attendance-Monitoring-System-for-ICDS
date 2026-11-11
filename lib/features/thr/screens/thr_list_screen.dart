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
import '../../../data/models/thr_transaction.dart';
import '../../../data/repositories/beneficiary_repo.dart';
import '../../../data/repositories/thr_repo.dart';
import '../../../shared/widgets/verify_fallback_dialog.dart';

class ThrListScreen extends ConsumerStatefulWidget {
  final BeneficiaryType type;
  const ThrListScreen({super.key, required this.type});

  @override
  ConsumerState<ThrListScreen> createState() => _ThrListScreenState();
}

class _ThrListScreenState extends ConsumerState<ThrListScreen> {
  List<Beneficiary> items = [];
  Set<int> providedToday = {};
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

    final provided = <int>{};
    for (final b in list) {
      final recs = await isarService.isar.thrTransactions
          .where()
          .beneficiaryIdEqualTo(b.id)
          .findAll();
      final hasToday = recs.any((r) =>
          !r.providedAt.isBefore(dayStart) && r.providedAt.isBefore(dayEnd));
      if (hasToday) provided.add(b.id);
    }

    if (mounted) {
      setState(() {
        items = list;
        providedToday = provided;
        loading = false;
      });
    }
  }

  void _showSuccess(String name, VerificationMethod method) {
    final methodText = switch (method) {
      VerificationMethod.qr => 'via QR',
      VerificationMethod.otp => 'via OTP',
      VerificationMethod.manual => 'via manual',
    };

    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_rounded,
                    color: AppColors.success, size: 36),
              ),
              const SizedBox(height: AppSizes.md),
              const Text(
                'THR provided Successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '$name · $methodText',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12, color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSizes.lg),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showFallbackPicker() async {
    final chosen = await showModalBottomSheet<Beneficiary>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg)),
      ),
      builder: (_) => _beneficiaryPickerSheet(items),
    );
    if (chosen == null || !mounted) return;

    final method = await showDialog<VerificationMethod>(
      context: context,
      builder: (_) => VerifyFallbackDialog(beneficiary: chosen),
    );
    if (method == null || !mounted) return;

    await ref.read(thrRepoProvider).provide(
          beneficiaryId: chosen.id,
          item: ThrItem.takeHomeRation,
          verification: method,
        );

    if (mounted) {
      setState(() => providedToday.add(chosen.id));
      _showSuccess(chosen.name, method);
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
              'Select Beneficiary',
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
                final isDone = providedToday.contains(b.id);
                return ListTile(
                  enabled: !isDone,
                  onTap: isDone
                      ? null
                      : () => Navigator.of(context).pop(b),
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
      case BeneficiaryType.pregnant:
        return 'Pregnant Women';
      case BeneficiaryType.lactating:
        return 'Lactating Mother';
      default:
        return 'Beneficiaries';
    }
  }

  String _ageLabel(Beneficiary b) {
    if (b.type == BeneficiaryType.pregnant ||
        b.type == BeneficiaryType.lactating) {
      return b.guardianName ?? 'Registered';
    }
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
    // Sort: not-done first, done last
    final pending =
        items.where((b) => !providedToday.contains(b.id)).toList();
    final done = items.where((b) => providedToday.contains(b.id)).toList();

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
                                      '${AppRoutes.qrScanner}?type=${widget.type.name}&kind=thr',
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
                                  onPressed: _showFallbackPicker,
                                  icon: const Icon(Icons.qr_code_2_rounded),
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
                                  'THR Received (${providedToday.length}/${items.length})',
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

                          // Pending first
                          ...pending.map((b) => _row(b, false)),
                          // Done last
                          ...done.map((b) => _row(b, true)),
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

  Widget _row(Beneficiary b, bool isProvided) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: isProvided
              ? AppColors.success.withValues(alpha: 0.04)
              : Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(
            color: isProvided
                ? AppColors.success.withValues(alpha: 0.4)
                : AppColors.border,
            width: isProvided ? 1.5 : 1,
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
            if (isProvided)
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
                child: const Icon(Icons.card_giftcard_rounded,
                    size: 16, color: AppColors.primary),
              ),
          ],
        ),
      ),
    );
  }
}