import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'prefetch_collections.dart';

/// Simple offline-first bootstrap:
/// 1) Enable Firestore local persistence (handled in `main.dart`).
/// 2) On first app run (when internet is available), prefetch each
///    Firestore collection once to warm the local cache.
class OfflineBootstrap {
  static const _prefetchedKey = 'offline_prefetched_v1';

  static Future<void> prefetchCollectionsInBackground() async {
    final prefs = await SharedPreferences.getInstance();
    final alreadyPrefetched = prefs.getBool(_prefetchedKey) ?? false;
    if (alreadyPrefetched) return;

    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) return;

    // Prefetching can take time; we do best-effort and skip failures.
    for (final collectionName in prefetchCollections) {
      try {
        await FirebaseFirestore.instance.collection(collectionName).get();
      } catch (_) {
        // Ignore individual failures so one bad collection doesn't block startup.
      }
    }

    await prefs.setBool(_prefetchedKey, true);
  }
}
