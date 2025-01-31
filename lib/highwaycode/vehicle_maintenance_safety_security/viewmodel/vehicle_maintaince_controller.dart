import 'package:flutter/material.dart';

import '../model/vehicle_maintaince_model.dart';
import '../repo/vehicle_maintaince_repo.dart';

class VehicleMaintenanceProvider with ChangeNotifier {
  final VehicleMaintenanceRepository _repository = VehicleMaintenanceRepository();
  VehicleMaintenance? _document;
  bool _isLoading = true;
  String _error = '';

  VehicleMaintenance? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  VehicleMaintenanceProvider() {
    fetchVehicleMaintenanceDocument();
  }

  Future<void> fetchVehicleMaintenanceDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getVehicleMaintenanceDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load Vehicle Maintenance document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
