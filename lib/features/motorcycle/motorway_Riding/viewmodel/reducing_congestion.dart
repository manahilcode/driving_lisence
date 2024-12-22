import 'package:flutter/material.dart';

import '../model/reducing_congestion.dart';
import '../repo/reducing_congession.dart';

class TrafficManagementProvider extends ChangeNotifier {
  TrafficManagementModel? _trafficManagementData;
  final TrafficManagementRepository _repository = TrafficManagementRepository();

  TrafficManagementModel? get trafficManagementData => _trafficManagementData;

  // Method to fetch data from Firestore and update the model
  Future<void> fetchTrafficManagementData() async {
    try {
      _trafficManagementData = await _repository.getTrafficManagementData();
      notifyListeners(); // Notify listeners about data change
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
