import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/repositories/beneficiary_repo.dart';

class ChildrenListScreen extends ConsumerStatefulWidget {
  final BeneficiaryType type;
  const ChildrenListScreen({super.key, required this.type});

  @override
  ConsumerState<ChildrenListScreen> createState() => _ChildrenListScreenState();
}

class _ChildrenListScreenState extends ConsumerState<ChildrenListScreen> {
  List<Beneficiary> items = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = ref.read(beneficiaryRepoProvider);
    final list = await repo.byType(widget.type);
    if (mounted) {
      setState(() {
        items = list;
        loading = false;
      });
    }
  }

  String _titleFor(BeneficiaryType t) {
    switch (t) {
      case BeneficiaryType.child0to6m:
        return 'Children (0 - 6 Months)';
      case BeneficiaryType.child6mTo3y:
        return 'Children (6 Mon - 3 Years)';
      case BeneficiaryType.child3to6y:
        return 'Children (3 - 6 Years)';
      case BeneficiaryType.pregnant:
        return 'Pregnant Women';
      case BeneficiaryType.lactating:
        return 'Lactating Mother';
      case BeneficiaryType.adolescent:
        return 'Adolescent Girls';
    }
  }

  String _ageLabel(Beneficiary b) {
    if (b.dateOfBirth == null) return '—';
    final months = (DateTime.now().year - b.dateOfBirth!.year) * 12 +
        (DateTime.now().month - b.dateOfBirth!.month);
    if (months < 12) return '${months}M';
    final years = months ~/ 12;
    final rem = months % 12;
    return rem == 0 ? '${years}Y' : '${years}Y ${rem}M';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            Expanded(
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : items.isEmpty
                      ? _emptyState()
                      : ListView.separated(
                          padding: const EdgeInsets.all(AppSizes.screenPadding),
                          itemCount: items.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: AppSizes.sm),
                          itemBuilder: (_, i) => _childCard(items[i]),
                        ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(
          '${AppRoutes.addBeneficiary}?type=${widget.type.name}',
        ),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_rounded, color: Colors.white),
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
            onPressed: () => context.go(AppRoutes.beneficiaries),
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          Expanded(
            child: Text(
              _titleFor(widget.type),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
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

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_off_rounded,
              size: 60, color: AppColors.textHint.withValues(alpha: 0.5)),
          const SizedBox(height: 12),
          const Text(
            'No beneficiaries yet',
            style: TextStyle(color: AppColors.textHint, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _childCard(Beneficiary b) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: InkWell(
        onTap: () => context.push(
          '${AppRoutes.beneficiaryDetail}/${b.id}',
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
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  b.name.isNotEmpty ? b.name[0].toUpperCase() : '?',
                  style: const TextStyle(
                    fontSize: 18,
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
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'AGE: ${_ageLabel(b)} · GENDER: ${b.gender.name[0].toUpperCase()}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textHint,
                        letterSpacing: 0.4,
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