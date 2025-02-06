// lib/providers/traffic_sign_info_provider.dart
import 'package:driving_lisence/features/trafficsign/you_know_traffic_sign/repo/you_know_traffic_repo.dart';
import 'package:flutter/material.dart';

import '../model/you_know_traffic_model.dart';

class TrafficSignInfoProvider extends ChangeNotifier {
  final TrafficSignInfoRepository repository;

  TrafficSignInfoProvider({required this.repository});

  bool isLoading = false;
  TrafficSignInfo44? trafficSignInfo;

  Future<void> fetchTrafficSignInfo() async {
    isLoading = true;
    notifyListeners();

    try {
      trafficSignInfo = await repository.getTrafficSignInfo();
    } catch (e) {
      debugPrint('Error fetching Traffic Sign Info: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
