import 'package:flutter/material.dart';

import '../model/parking_at_night_model.dart';
import '../repo/parking_at_night_repo.dart';

class ParkingAtNightProvider extends ChangeNotifier {
  ParkingAtNight? _parkingData;
  bool _isLoading = true;
  String _errorMessage = '';

  // Getters for data and state
  ParkingAtNight? get parkingData => _parkingData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from the repository
  Future<void> fetchParkingAtNightData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _parkingData = await ParkingAtNightRepository().fetchParkingAtNightData();
      _errorMessage = ''; // Clear any previous error messages
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about the state change
    }
  }
}
