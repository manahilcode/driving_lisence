import 'package:flutter/material.dart';
import '../model/riding_on_motorway.dart';
import '../repo/riding_on_motorway.dart';

class MotorwayRidingProvider extends ChangeNotifier {
  MotorwayRidingModelRiding? _motorwayRidingData;
  final MotorwayRidingRepositoryRiding _repository = MotorwayRidingRepositoryRiding();

  MotorwayRidingModelRiding? get motorwayRidingData => _motorwayRidingData;

  // Method to fetch data from Firestore and update the model
  Future<void> fetchMotorwayRidingData() async {
    try {
      _motorwayRidingData = await _repository.getMotorwayRidingData();
      notifyListeners(); // Notify listeners about data change
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
