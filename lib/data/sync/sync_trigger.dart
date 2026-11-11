import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'sync_service.dart';

class SyncTrigger {
  final SyncService _sync;
  final Connectivity _connectivity;
  StreamSubscription? _sub;
  Timer? _pollTimer;

  SyncTrigger(this._sync) : _connectivity = Connectivity();

  Future<void> start() async {
    // 1. Immediate attempt on startup
    await _sync.pushPendingItems();

    // 2. Listen for connectivity stream changes
    _sub = _connectivity.onConnectivityChanged.listen((results) {
      final online = results.any((r) =>
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.ethernet);
      if (online) {
        debugPrint('SYNC_TRIGGER: network available, pushing');
        _sync.pushPendingItems();
      }
    });

    // 3. Poll every 30s — fallback for devices where the stream is unreliable
    _pollTimer = Timer.periodic(const Duration(seconds: 30), (_) async {
      final results = await _connectivity.checkConnectivity();
      final online = results.any((r) =>
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.ethernet);
      if (online) {
        debugPrint('SYNC_TRIGGER: poll — attempting push');
        await _sync.pushPendingItems();
      }
    });
  }

  void dispose() {
    _sub?.cancel();
    _pollTimer?.cancel();
  }
}