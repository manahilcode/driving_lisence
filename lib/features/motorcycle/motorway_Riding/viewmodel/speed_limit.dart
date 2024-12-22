import 'package:flutter/material.dart';

import '../model/speed_limit.dart';
import '../repo/speed_limit.dart';

class SpeedLimitQuestionProvider extends ChangeNotifier {
  SpeedLimitModel? _speedLimitQuestionData;
  final SpeedLimitQuestionRepository _repository = SpeedLimitQuestionRepository();

  SpeedLimitModel? get speedLimitQuestionData => _speedLimitQuestionData;

  // Fetch speed limit question data
  Future<void> fetchSpeedLimitQuestionData() async {
    try {
      _speedLimitQuestionData = await _repository.getSpeedLimitQuestionData();
      notifyListeners(); // Notify listeners that the data has changed
    } catch (e) {
      print("Error fetching speed limit question data: $e");
    }
  }
}
