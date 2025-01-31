import 'package:flutter/material.dart';

import '../model/driving_in_built_up_areas_model.dart';
import '../repo/driving_in_built_up_areas_repo.dart';

class DrivingInBuiltUpAreaProvider extends ChangeNotifier {
  DrivingInBuiltUpArea? _drivingInBuiltUpAreaData;
  bool _isLoading = true;
  String _errorMessage = '';

  // Getters for state management
  DrivingInBuiltUpArea? get drivingInBuiltUpAreaData => _drivingInBuiltUpAreaData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from the repository
  Future<void> fetchDrivingInBuiltUpAreaData() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners about the loading state

    try {
      _drivingInBuiltUpAreaData = await DrivingInBuiltUpAreaRepository().fetchDrivingInBuiltUpAreaData();
      _errorMessage = ''; // Clear any error message
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about the state change
    }
  }
}
