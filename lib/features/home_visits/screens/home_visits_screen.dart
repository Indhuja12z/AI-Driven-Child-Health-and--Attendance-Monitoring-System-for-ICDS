import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar_community/isar.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/routes/app_router.dart';
import '../../../data/local/isar_service.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/models/home_visit.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';

class HomeVisitsScreen extends ConsumerStatefulWidget {
  const HomeVisitsScreen({super.key});

  @override
  ConsumerState<HomeVisitsScreen> createState() => _HomeVisitsScreenState();
}

class _HomeVisitsScreenState extends ConsumerState<HomeVisitsScreen> {
  int _selectedTab = 0;
  final tabs = ['Due', 'Completed', 'Missing'];

  List<HomeVisit> _allVisits = [];
  Map<int, Beneficiary> _beneficiaryMap = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final visits = await isarService.isar.homeVisits.where().findAll();

    // Sort: High severity first, then by due date
    visits.sort((a, b) {
      final sevCompare = a.severity.index.compareTo(b.severity.index);
      if (sevCompare != 0) return sevCompare;
      return a.scheduledFor.compareTo(b.scheduledFor);
    });

    // Load associated beneficiaries
    final ids = visits.map((v) => v.beneficiaryId).toSet();
    final beneficiaries =
        await isarService.isar.beneficiaries.getAll(ids.toList());

    final map = <int, Beneficiary>{};
    for (final b in beneficiaries) {
      if (b != null) map[b.id] = b;
    }

    if (mounted) {
      setState(() {
        _allVisits = visits;
        _beneficiaryMap = map;
        _loading = false;
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
        context.go(AppRoutes.report);
    }
  }

  List<HomeVisit> get _filteredVisits {
    final status = tabs[_selectedTab].toLowerCase();
    return _allVisits.where((v) => v.status.name == status).toList();
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
            _filterTabs(),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: _load,
                      child: _filteredVisits.isEmpty
                          ? _emptyState()
                          : ListView.separated(
                              padding:
                                  const EdgeInsets.all(AppSizes.screenPadding),
                              itemCount: _filteredVisits.length,
                              separatorBuilder: (_, _) =>
                                  const SizedBox(height: AppSizes.sm),
                              itemBuilder: (_, i) =>
                                  _visitCard(_filteredVisits[i]),
                            ),
                    ),
            ),
            AppBottomNavBar(
              current: AppTab.home,
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
              'Home Visits',
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

  Widget _filterTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.screenPadding,
        vertical: AppSizes.sm,
      ),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final active = _selectedTab == i;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTab = i),
              child: Container(
                margin: EdgeInsets.only(right: i < tabs.length - 1 ? 8 : 0),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: active ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusPill),
                  border: Border.all(
                    color: active ? AppColors.primary : AppColors.border,
                  ),
                ),
                child: Text(
                  tabs[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: active ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_rounded,
              size: 60, color: AppColors.textHint.withValues(alpha: 0.5)),
          const SizedBox(height: 12),
          Text(
            'No ${tabs[_selectedTab].toLowerCase()} visits',
            style: const TextStyle(color: AppColors.textHint, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Color _severityColor(VisitSeverity severity) {
    switch (severity) {
      case VisitSeverity.high:
        return AppColors.samRed;
      case VisitSeverity.moderate:
        return AppColors.mamOrange;
      case VisitSeverity.low:
        return AppColors.success;
    }
  }

  String _severityLabel(VisitSeverity severity) {
    switch (severity) {
      case VisitSeverity.high:
        return 'HIGH';
      case VisitSeverity.moderate:
        return 'MODERATE';
      case VisitSeverity.low:
        return 'LOW';
    }
  }

  Widget _visitCard(HomeVisit visit) {
    final b = _beneficiaryMap[visit.beneficiaryId];
    final severityColor = _severityColor(visit.severity);
    final displayName = b?.name ?? 'Unknown';

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: InkWell(
        onTap: () => context.push(AppRoutes.homeVisitDetail),
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Container(
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Severity badge
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: severityColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      _severityLabel(visit.severity),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: severityColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (visit.notes != null)
                    Expanded(
                      child: Text(
                        visit.notes!,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textHint,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              // Main row
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: severityColor.withValues(alpha: 0.10),
                      shape: BoxShape.circle,
                      border: Border.all(color: severityColor, width: 2),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      displayName.isNotEmpty ? displayName[0] : '?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: severityColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSizes.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Due: ${_formatDate(visit.scheduledFor)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: visit.scheduledFor
                                    .isBefore(DateTime.now())
                                ? AppColors.danger
                                : AppColors.textHint,
                            fontWeight:
                                visit.scheduledFor.isBefore(DateTime.now())
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.home_work_rounded,
                    color: severityColor,
                    size: 22,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime d) {
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/${d.year}';
  }
}