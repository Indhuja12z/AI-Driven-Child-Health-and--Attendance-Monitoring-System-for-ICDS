import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../local/isar_service.dart';
import '../repositories/sync_repo.dart';
import 'sync_service.dart';

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(
    isar: isarService,
    syncRepo: ref.read(syncRepoProvider),
  );
});