import 'package:flutter/material.dart';

import '../model/vehicle_prohibited_using_road_pavement_model.dart';
import '../repo/vehicle_prohibited_using_road_pavement_repo.dart';

class ProhibitedVehicleProvider extends ChangeNotifier {
  final ProhibitedVehicleRepository _repository;
  ProhibitedVehicle? _vehicleData;
  bool _isLoading = false;
  String? _errorMessage;

  ProhibitedVehicle? get vehicleData => _vehicleData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  ProhibitedVehicleProvider(this._repository);

  // Method to fetch data from the repository
  Future<void> getProhibitedVehicleData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _vehicleData = await _repository.fetchProhibitedVehicleData();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
