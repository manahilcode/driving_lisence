import 'package:flutter/material.dart';

import '../model/control_the_vehicle_model.dart';
import '../repo/control_the_vehicle_repo.dart';

class ControlOfTheVehicleProvider extends ChangeNotifier {
  ControlOfTheVehicle? _controlOfTheVehicleData;
  bool _isLoading = true;
  String _errorMessage = '';

  // Getters for the state
  ControlOfTheVehicle? get controlOfTheVehicleData => _controlOfTheVehicleData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from the repository
  Future<void> fetchControlOfTheVehicleData() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners that loading has started

    try {
      _controlOfTheVehicleData = await ControlOfTheVehicleRepository().fetchControlOfTheVehicleData();
      _errorMessage = ''; // Clear any previous error messages
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about state change
    }
  }
}
