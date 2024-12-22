import 'package:flutter/material.dart';

import '../model/stopping_breakdown.dart';
import '../repo/stopping_breakdown.dart';

class EmergencyTelephonePositioningProvider extends ChangeNotifier {
  StoppingBreakdownModel? _emergencyTelephonePositioningData;
  final StoppingBreakdownRepository _repository = StoppingBreakdownRepository();

  StoppingBreakdownModel? get emergencyTelephonePositioningData => _emergencyTelephonePositioningData;

  // Fetch emergency telephone positioning data
  Future<void> fetchEmergencyTelephonePositioningData() async {
    try {
      _emergencyTelephonePositioningData = await _repository.getEmergencyTelephonePositioningData();
      notifyListeners(); // Notify listeners that the data has changed
    } catch (e) {
      print("Error fetching emergency telephone positioning data: $e");
    }
  }
}
