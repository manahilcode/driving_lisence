import 'package:flutter/material.dart';

import '../model/vehicle_towing_and_loading_model.dart';
import '../repo/vehicle_towing_and_loading_repo.dart';

class VehicleTowingAndLoadingProvider with ChangeNotifier {
  final VehicleTowingAndLoadingRepository _repository = VehicleTowingAndLoadingRepository();

  VehicleTowingAndLoadingModel? _vehicleTowingData;
  bool _isLoading = false;
  String _errorMessage = '';

  VehicleTowingAndLoadingModel? get vehicleTowingData => _vehicleTowingData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchVehicleTowingAndLoading() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _vehicleTowingData = await _repository.fetchVehicleTowingAndLoading();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
