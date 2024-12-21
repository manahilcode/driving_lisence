import 'package:flutter/material.dart';

import '../model/safety_margin1_model.dart';
import '../repo/safety_margin1_repo.dart';

class SafetyMargin1Notifier extends ChangeNotifier {
  SafetyMargin1? _data;

  SafetyMargin1? get data => _data;

  Future<void> fetchSafetyMargin1Data() async {
    try {
      SafetyMargin1Repository repository = SafetyMargin1Repository();
      _data = await repository.getSafetyMargin1Data();
      notifyListeners();
    } catch (e) {
      print("Error fetching Safety Margin1 data: $e");
    }
  }
}
