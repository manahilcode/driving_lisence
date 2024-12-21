import 'package:flutter/material.dart';

import '../model/safety_margin_model.dart';
import '../repo/safety_margin_repo.dart';

class SafetyMarginNotifier extends ChangeNotifier {
  SafetyMargin? _data;

  SafetyMargin? get data => _data;

  Future<void> fetchSafetyMarginData() async {
    try {
      SafetyMarginRepository repository = SafetyMarginRepository();
      _data = await repository.getSafetyMarginData();
      notifyListeners();
    } catch (e) {
      print("Error fetching Safety Margin data: $e");
    }
  }
}
