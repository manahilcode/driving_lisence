import 'package:flutter/material.dart';

import '../model/vehicle_security_model.dart';
import '../repo/vehicle_security_repo.dart';

class VehicleSecurityProvider with ChangeNotifier {
  final VehicleSecurityRepository _repository = VehicleSecurityRepository();
  VehicleSecurity? _document;
  bool _isLoading = true;
  String _error = '';

  VehicleSecurity? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  VehicleSecurityProvider() {
    fetchVehicleSecurityDocument();
  }

  Future<void> fetchVehicleSecurityDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getVehicleSecurityDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load Vehicle Security document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
