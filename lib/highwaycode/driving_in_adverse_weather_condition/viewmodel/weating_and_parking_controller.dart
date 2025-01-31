
import 'package:flutter/material.dart';

import '../model/weating_and_parking_model.dart';
import '../repo/weating_and_parking_repo.dart';

class WaitingAndParkingProvider extends ChangeNotifier {
  WaitingAndParking? _waitingAndParkingData;
  bool _isLoading = true;
  String _errorMessage = '';

  // Getters for state management
  WaitingAndParking? get waitingAndParkingData => _waitingAndParkingData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from the repository
  Future<void> fetchWaitingAndParkingData() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners about the loading state

    try {
      _waitingAndParkingData = await WaitingAndParkingRepository().fetchWaitingAndParkingData();
      _errorMessage = ''; // Clear any error message
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about the state change
    }
  }
}
