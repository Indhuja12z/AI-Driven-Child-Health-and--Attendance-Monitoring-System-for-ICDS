import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/role_select_screen.dart';
import '../../features/auth/screens/phone_login_screen.dart';
import '../../features/auth/screens/otp_screen.dart';
import '../../features/home/screens/aww_home_screen.dart';
import '../../data/models/beneficiary.dart';
import '../../features/beneficiaries/screens/beneficiaries_screen.dart';
import '../../features/beneficiaries/screens/children_list_screen.dart';
import '../../features/beneficiaries/screens/beneficiary_detail_screen.dart';
import '../../features/beneficiaries/screens/add_beneficiary_screen.dart';
import '../../features/growth/screens/height_weight_screen.dart';
import '../../features/growth/screens/growth_monitoring_screen.dart';
import '../../data/models/attendance.dart';
import '../../features/attendance/screens/attendance_categories_screen.dart';
import '../../features/attendance/screens/mark_attendance_screen.dart';
import '../../features/attendance/screens/qr_scanner_screen.dart';
import '../../features/attendance/screens/hcm_screen.dart';
import '../../features/attendance/screens/hcm_done_screen.dart';
import '../../features/settings/screens/qr_download_screen.dart';
import '../../features/report/screens/report_screen.dart';
import '../../features/home_visits/screens/home_visits_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/notifications/screens/aww_notifications_screen.dart';
import '../../features/notifications/screens/parent_notifications_screen.dart';
import '../../features/parent/screens/parent_home_screen.dart';
import '../../features/supervisor/screens/supervisor_home_screen.dart';
import '../../features/supervisor/screens/audit_dashboard_screen.dart';
import '../../features/thr/screens/thr_list_screen.dart';
import '../../features/thr/screens/thr_categories_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/role_select_screen.dart';
import '../../features/auth/screens/phone_login_screen.dart';
import '../../features/auth/screens/otp_screen.dart';
class AppRoutes {
  // Auth
  static const String login = '/';
  static const String roleSelect = '/role-select';
  static const String phoneLogin = '/phone-login';
  static const String otp = '/otp';
  static const String awwHome = '/aww-home';

  // Main tabs
  static const String beneficiaries = '/beneficiaries';
  static const String growthMonitoring = '/growth-monitoring';
  static const String thrCategories = '/thr';
  static const String thrList = '/thr-list';
  static const String report = '/report';

  // Sub-screens
  static const String attendanceCategories = '/attendance-categories';
  static const String hcm = '/hcm';
  static const String homeVisits = '/home-visits';
  static const String awwNotifications = '/aww-notifications';
  static const String settings = '/settings';

  // In AppRoutes class, add:
static const String childrenList = '/children-list';
static const String beneficiaryDetail = '/beneficiary-detail';
static const String addBeneficiary = '/add-beneficiary';
static const String heightWeight = '/height-weight';

// In AppRoutes class:
static const String markAttendance = '/mark-attendance';
static const String qrScanner = '/qr-scanner';
static const String hcmDone = '/hcm-done';

// In AppRoutes class:
static const String qrDownload = '/qr-download';

// In AppRoutes:
static const String homeVisitDetail = '/home-visit-detail';

// In AppRoutes:
static const String parentHome = '/parent-home';
static const String parentNotifications = '/parent-notifications';
static const String supervisorHome = '/supervisor-home';
static const String auditDashboard = '/audit-dashboard';
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen(this.title);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text('$title — coming soon')),
      );
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginScreen()),
    GoRoute(
        path: AppRoutes.roleSelect,
        builder: (_, _) => const RoleSelectScreen()),
    GoRoute(
        path: AppRoutes.phoneLogin,
        builder: (_, _) => const PhoneLoginScreen()),
  GoRoute(
  path: AppRoutes.otp,
  builder: (context, state) {
    final phone = state.uri.queryParameters['phone'] ?? '';
    return OtpScreen(phone: phone);
  },
),
    GoRoute(path: AppRoutes.awwHome, builder: (_, _) => const AwwHomeScreen()),

    // Placeholders for nav targets (built in later batches)
    GoRoute(
  path: AppRoutes.beneficiaries,
  builder: (_, _) => const BeneficiariesScreen(),
),
    GoRoute(
        path: AppRoutes.growthMonitoring,
        builder: (_, _) => const GrowthMonitoringScreen()),
  GoRoute(
  path: AppRoutes.thrList,
  builder: (context, state) {
    final typeStr = state.uri.queryParameters['type'] ?? 'child6mTo3y';
    final type = BeneficiaryType.values.firstWhere(
      (e) => e.name == typeStr,
      orElse: () => BeneficiaryType.child6mTo3y,
    );
    return ThrListScreen(type: type);
  },
),
GoRoute(
  path: AppRoutes.thrCategories,
  builder: (_, _) => const ThrCategoriesScreen(),
),
GoRoute(
  path: AppRoutes.thrList,
  builder: (context, state) {
    final typeStr = state.uri.queryParameters['type'] ?? 'child6mTo3y';
    final type = BeneficiaryType.values.firstWhere(
      (e) => e.name == typeStr,
      orElse: () => BeneficiaryType.child6mTo3y,
    );
    return ThrListScreen(type: type);
  },
),
    GoRoute(
        path: AppRoutes.report,
        builder: (_, _) => const  ReportScreen()),
    GoRoute(
        path: AppRoutes.attendanceCategories,
        builder: (_, _) => const AttendanceCategoriesScreen()),
    GoRoute(
        path: AppRoutes.hcm, builder: (_, _) => const HcmScreen()),
    GoRoute(
        path: AppRoutes.homeVisits,
        builder: (_, _) => const HomeVisitsScreen()),
    GoRoute(
        path: AppRoutes.awwNotifications,
        builder: (_, _) => const  AwwNotificationsScreen()),
    GoRoute(
        path: AppRoutes.settings,
        builder: (_, _) => const SettingsScreen()),

        // In routes list, replace the placeholder for Beneficiaries with:
GoRoute(
  path: AppRoutes.beneficiaries,
  builder: (_, _) => const BeneficiariesScreen(),
),
GoRoute(
  path: AppRoutes.childrenList,
  builder: (context, state) {
    final typeStr = state.uri.queryParameters['type'] ?? 'child0to6m';
    final type = BeneficiaryType.values.firstWhere(
      (e) => e.name == typeStr,
      orElse: () => BeneficiaryType.child0to6m,
    );
    return ChildrenListScreen(type: type);
  },
),
GoRoute(
  path: '${AppRoutes.beneficiaryDetail}/:id',
  builder: (context, state) {
    final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
    return BeneficiaryDetailScreen(beneficiaryId: id);
  },
),
GoRoute(
  path: AppRoutes.addBeneficiary,
  builder: (context, state) {
    final typeStr = state.uri.queryParameters['type'];
    final type = typeStr == null
        ? null
        : BeneficiaryType.values.firstWhere(
            (e) => e.name == typeStr,
            orElse: () => BeneficiaryType.child0to6m,
          );
    return AddBeneficiaryScreen(presetType: type);
  },
),

GoRoute(
  path: '${AppRoutes.heightWeight}/:id',
  builder: (context, state) {
    final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
    return HeightWeightScreen(beneficiaryId: id);
  },
),

// In routes list, add/replace:
GoRoute(
  path: AppRoutes.attendanceCategories,
  builder: (_, _) => const AttendanceCategoriesScreen(),
),
GoRoute(
  path: AppRoutes.markAttendance,
  builder: (context, state) {
    final typeStr = state.uri.queryParameters['type'] ?? 'child6mTo3y';
    final kindStr = state.uri.queryParameters['kind'] ?? 'pse';
    final type = BeneficiaryType.values.firstWhere(
      (e) => e.name == typeStr,
      orElse: () => BeneficiaryType.child6mTo3y,
    );
    final kind = AttendanceKind.values.firstWhere(
      (e) => e.name == kindStr,
      orElse: () => AttendanceKind.pse,
    );
    return MarkAttendanceScreen(type: type, kind: kind);
  },
),
GoRoute(
  path: AppRoutes.qrScanner,
  builder: (context, state) {
    final typeStr = state.uri.queryParameters['type'] ?? 'child6mTo3y';
    final kindStr = state.uri.queryParameters['kind'] ?? 'pse';
    final isThr = kindStr == 'thr';
    final type = BeneficiaryType.values.firstWhere(
      (e) => e.name == typeStr,
      orElse: () => BeneficiaryType.child6mTo3y,
    );
    final kind = isThr
        ? AttendanceKind.pse
        : AttendanceKind.values.firstWhere(
            (e) => e.name == kindStr,
            orElse: () => AttendanceKind.pse,
          );
    return QrScannerScreen(type: type, kind: kind, isThrFlow: isThr);
  },
),
GoRoute(
  path: AppRoutes.hcm,
  builder: (_, _) => const HcmScreen(),
),
GoRoute(
  path: AppRoutes.hcmDone,
  builder: (_, _) => const HcmDoneScreen(),
),
// In routes:
GoRoute(
  path: '${AppRoutes.qrDownload}/:id',
  builder: (context, state) {
    final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
    return QrDownloadScreen(beneficiaryId: id);
  },
),

// In routes list:
GoRoute(
  path: AppRoutes.parentHome,
  builder: (_, _) => const ParentHomeScreen(),
),
GoRoute(
  path: AppRoutes.parentNotifications,
  builder: (_, _) => const ParentNotificationsScreen(),
),
GoRoute(
  path: AppRoutes.supervisorHome,
  builder: (_, _) => const SupervisorHomeScreen(),
),
GoRoute(
  path: AppRoutes.auditDashboard,
  builder: (_, _) => const AuditDashboardScreen(),
),
  ],
);