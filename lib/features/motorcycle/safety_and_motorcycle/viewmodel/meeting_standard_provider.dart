import 'package:flutter/material.dart';

import '../model/meeting_standard.dart';
import '../repo/meeting_standard.dart';

class MotorcycleSafetyNotifierSafety extends ChangeNotifier {
  MotorCycleMeetingStandard? _safetyData;

  MotorCycleMeetingStandard? get safetyData => _safetyData;

  // Fetch the safety data from the repository
  Future<void> fetchData() async {
    try {
      MeetingStandardRepo repository = MeetingStandardRepo();
      _safetyData = await repository.getMotorcycleSafetyData();
      notifyListeners();
    } catch (e) {
      // Handle error, you can also add error message state
      print("Error fetching data: $e");
    }
  }
}
