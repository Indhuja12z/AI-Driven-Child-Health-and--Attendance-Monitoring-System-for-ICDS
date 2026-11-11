import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/utils/validators.dart';
import '../../../data/local/isar_service.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/repositories/growth_repo.dart';

class HeightWeightScreen extends ConsumerStatefulWidget {
  final int beneficiaryId;
  const HeightWeightScreen({super.key, required this.beneficiaryId});

  @override
  ConsumerState<HeightWeightScreen> createState() =>
      _HeightWeightScreenState();
}

class _HeightWeightScreenState extends ConsumerState<HeightWeightScreen> {
  Beneficiary? child;
  DateTime? _fallbackDob;
  final _formKey = GlobalKey<FormState>();
  final _heightCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  DateTime _measuredAt = DateTime.now();
  bool _loading = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _heightCtrl.dispose();
    _weightCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final b = await isarService.isar.beneficiaries.get(widget.beneficiaryId);
    if (mounted) {
      setState(() {
        child = b;
        if (b?.lastHeightCm != null) {
          _heightCtrl.text = b!.lastHeightCm!.toStringAsFixed(1);
        }
        if (b?.lastWeightKg != null) {
          _weightCtrl.text = b!.lastWeightKg!.toStringAsFixed(1);
        }
        _loading = false;
      });
    }
  }

Future<void> _pickFallbackDob() async {
  final picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now().subtract(const Duration(days: 365 * 2)),
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
  );
  if (picked != null) {
    setState(() => _fallbackDob = picked);
    // Save it back to the beneficiary immediately
    child!.dateOfBirth = picked;
    child!.isDirty = true;
    child!.updatedAt = DateTime.now();
    await isarService.isar.writeTxn(() =>
        isarService.isar.beneficiaries.put(child!));
  }
}
  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _measuredAt,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _measuredAt = picked);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    // Block submission if DOB is still missing
  if (child!.dateOfBirth == null && _fallbackDob == null) {
    _showError('Please set the date of birth first');
    return;
  }

    final h = double.parse(_heightCtrl.text.trim());
    final w = double.parse(_weightCtrl.text.trim());

    if (!Validators.isValidHeight(h)) {
      _showError('Height must be between 30 and 200 cm');
      return;
    }
    if (!Validators.isValidWeight(w)) {
      _showError('Weight must be between 0.5 and 150 kg');
      return;
    }

    setState(() => _saving = true);

    try {
      await ref.read(growthRepoProvider).add(
            child: child!,
            heightCm: h,
            weightKg: w,
            measuredAt: _measuredAt,
          );

      // Reload child to get updated status
      final updated =
          await isarService.isar.beneficiaries.get(widget.beneficiaryId);
      if (mounted) {
        setState(() => _saving = false);
        _showResultModal(updated!);
      }
    } catch (e) {
      setState(() => _saving = false);
      _showError('Error: $e');
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: AppColors.danger,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showResultModal(Beneficiary b) {
    final status = b.lastStatus;
    final (label, color, icon) = _statusMeta(status);

    showDialog(
      context: context,
      barrierDismissible: false,
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
                  color: color.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 36),
              ),
              const SizedBox(height: AppSizes.md),
              const Text(
                'Growth Recorded',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                b.name,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSizes.md),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.lg),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.pop();
                  },
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  (String, Color, IconData) _statusMeta(NutritionalStatus? s) {
    switch (s) {
      case NutritionalStatus.sam:
        return ('Severe Acute Malnutrition', AppColors.samRed,
            Icons.warning_amber_rounded);
      case NutritionalStatus.mam:
        return ('Moderate Acute Malnutrition', AppColors.mamOrange,
            Icons.info_rounded);
      case NutritionalStatus.stunted:
        return ('Stunted', AppColors.accent, Icons.trending_down_rounded);
      case NutritionalStatus.wasted:
        return ('Wasted', AppColors.mamOrange, Icons.trending_down_rounded);
      case NutritionalStatus.underweight:
        return ('Underweight', AppColors.mamOrange, Icons.info_rounded);
      case NutritionalStatus.overweight:
        return ('Overweight', AppColors.accent, Icons.trending_up_rounded);
      case NutritionalStatus.normal:
      case null:
        return ('Healthy', AppColors.success, Icons.check_circle_rounded);
    }
  }

  String _ageLabel() {
    if (child?.dateOfBirth == null) return '—';
    final months = (DateTime.now().year - child!.dateOfBirth!.year) * 12 +
        (DateTime.now().month - child!.dateOfBirth!.month);
    if (months < 12) return '$months M';
    final y = months ~/ 12;
    final r = months % 12;
    return r == 0 ? '$y Y' : '$y Y $r M';
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (child == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Growth Monitoring')),
        body: const Center(child: Text('Beneficiary not found')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Growth Monitoring'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _profileCard(),
                const SizedBox(height: AppSizes.lg),

                // Date selector
                GestureDetector(
                  onTap: _pickDate,
                  child: Container(
                    padding: const EdgeInsets.all(16),
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
                        Text(
                          '${_measuredAt.day}/${_measuredAt.month}/${_measuredAt.year}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_down_rounded,
                            color: AppColors.textHint),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.md),

                // Height input
                TextFormField(
                  controller: _heightCtrl,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,1}')),
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Height (cm)',
                    prefixIcon: Icon(Icons.height_rounded,
                        color: AppColors.textHint),
                  ),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: AppSizes.md),

                // Weight input
                TextFormField(
                  controller: _weightCtrl,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,1}')),
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Weight (kg)',
                    prefixIcon: Icon(Icons.monitor_weight_rounded,
                        color: AppColors.textHint),
                  ),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: AppSizes.xl),

                ElevatedButton(
                  onPressed: _saving ? null : _submit,
                  child: _saving
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.10),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              child!.name.isNotEmpty ? child!.name[0].toUpperCase() : '?',
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
                  child!.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Gender: ${child!.gender.name[0].toUpperCase()} · Age: ${_ageLabel()}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textHint,
                  ),
                ),
                if (child!.lastHeightCm != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Last: ${child!.lastHeightCm!.toStringAsFixed(1)} cm · ${child!.lastWeightKg?.toStringAsFixed(1) ?? "—"} kg',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}