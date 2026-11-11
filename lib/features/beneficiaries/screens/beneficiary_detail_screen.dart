import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';
import '../../../data/local/isar_service.dart';
import '../../../data/models/beneficiary.dart';

class BeneficiaryDetailScreen extends ConsumerStatefulWidget {
  final int beneficiaryId;
  const BeneficiaryDetailScreen({super.key, required this.beneficiaryId});

  @override
  ConsumerState<BeneficiaryDetailScreen> createState() =>
      _BeneficiaryDetailScreenState();
}

class _BeneficiaryDetailScreenState
    extends ConsumerState<BeneficiaryDetailScreen> {
  Beneficiary? b;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final data = await isarService.isar.beneficiaries.get(widget.beneficiaryId);
    if (mounted) {
      setState(() {
        b = data;
        loading = false;
      });
    }
  }

  String _ageLabel() {
    if (b?.dateOfBirth == null) return '—';
    final months = (DateTime.now().year - b!.dateOfBirth!.year) * 12 +
        (DateTime.now().month - b!.dateOfBirth!.month);
    if (months < 12) return '$months M';
    final years = months ~/ 12;
    final rem = months % 12;
    return rem == 0 ? '$years Y' : '$years Y $rem M';
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (b == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Not found')),
        body: const Center(child: Text('Beneficiary not found')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _profileHeader(),
                    const SizedBox(height: AppSizes.lg),
                    _section('Verification Details'),
                    _verifyRow('Aadhaar',
                        b!.aadhaarNumber ?? 'Not linked', b!.aadhaarVerified),
                    _verifyRow('ABHA',
                        b!.abhaNumber ?? 'Not linked', b!.abhaNumber != null),
                    _verifyRow('eKYC',
                        b!.aadhaarVerified ? 'Verified' : 'Pending',
                        b!.aadhaarVerified),
                    _verifyRow('Face Verified',
                        b!.faceVerified ? 'Verified' : 'Pending',
                        b!.faceVerified),
                    const SizedBox(height: AppSizes.lg),
                    _section('Personal Details'),
                    _infoRow('Name', b!.name),
                    _infoRow('Gender',
                        b!.gender.name[0].toUpperCase() +
                            b!.gender.name.substring(1)),
                    _infoRow('Guardian', b!.guardianName ?? '—'),
                    _infoRow('Phone', b!.phoneNumber ?? '—'),
                    const SizedBox(height: AppSizes.lg),
                    _section('Vaccination Details'),
                    _vaccinationRow('BCG'),
                    _vaccinationRow('OPV-0'),
                    _vaccinationRow('Hepatitis B'),
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
              b!.name.toUpperCase(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          // QR button — opens the QR generation screen
          IconButton(
            onPressed: () => context.push('${AppRoutes.qrDownload}/${b!.id}'),
            icon: const Icon(Icons.qr_code_rounded),
          ),
        ],
      ),
    );
  }

  Widget _profileHeader() {
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              b!.name.isNotEmpty ? b!.name[0].toUpperCase() : '?',
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: AppSizes.md),
          Text(
            'Name: ${b!.name}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Gender: ${b!.gender.name[0].toUpperCase()}   ·   Age: ${_ageLabel()}',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.sm),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _verifyRow(String label, String value, bool ok) {
    return _row(
      leading: Icon(
        ok ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
        color: ok ? AppColors.success : AppColors.textHint,
        size: 20,
      ),
      title: label,
      trailing: value,
    );
  }

  Widget _infoRow(String label, String value) {
    return _row(
      leading: const Icon(Icons.info_outline_rounded,
          color: AppColors.textHint, size: 18),
      title: label,
      trailing: value,
    );
  }

  Widget _vaccinationRow(String label) {
    return _row(
      leading: const Icon(Icons.vaccines_rounded,
          color: AppColors.primary, size: 18),
      title: label,
      trailing: 'Due',
      trailingColor: AppColors.accent,
    );
  }

  Widget _row({
    required Widget leading,
    required String title,
    required String trailing,
    Color? trailingColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          leading,
          const SizedBox(width: 12),
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
          Flexible(
            child: Text(
              trailing,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: trailingColor ?? AppColors.textHint,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}