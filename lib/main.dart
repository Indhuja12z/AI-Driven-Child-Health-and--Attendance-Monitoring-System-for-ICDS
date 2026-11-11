import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'data/local/isar_service.dart';
import 'data/repositories/sync_repo.dart';
import 'data/seed/demo_seeder.dart';
import 'data/sync/sync_service.dart';
import 'data/sync/sync_trigger.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await isarService.init();
  await DemoSeeder(isarService).seedIfEmpty();

  // Setup sync
  final syncRepo = SyncRepo(isarService);
  final syncService = SyncService(isar: isarService, syncRepo: syncRepo);
  SyncTrigger(syncService).start();
  // Force an initial sync push
Future.delayed(const Duration(seconds: 2), () {
  syncService.pushPendingItems();
});

  runApp(const ProviderScope(child: LittleStepsApp()));
}

class LittleStepsApp extends StatelessWidget {
  const LittleStepsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Little Steps Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      routerConfig: appRouter,
    );
  }
}