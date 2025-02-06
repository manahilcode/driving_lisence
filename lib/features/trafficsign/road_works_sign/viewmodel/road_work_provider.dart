// lib/providers/road_work_sign_provider.dart
import 'package:flutter/material.dart';

import '../model/road_work_model.dart';
import '../repo/road_work_repo.dart';

class RoadWorkSignProvider extends ChangeNotifier {
  final RoadWorkSignRepository repository;

  RoadWorkSignProvider({required this.repository});

  bool isLoading = false;
  RoadWorkSign? roadWorkSign;

  Future<void> fetchRoadWorkSign() async {
    isLoading = true;
    notifyListeners();

    try {
      roadWorkSign = await repository.getRoadWorkSign();
    } catch (e) {
      debugPrint('Error fetching road work sign data: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
