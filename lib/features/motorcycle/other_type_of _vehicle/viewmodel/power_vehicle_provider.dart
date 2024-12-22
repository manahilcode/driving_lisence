import 'package:flutter/material.dart';
import '../model/power_vehicle_model.dart';
import '../repo/power_vehicle_repo.dart';

class PoweredVehicleInfoNotifier extends ChangeNotifier {
  PoweredVehicleInfo? _info;
  bool _isLoading = false;

  PoweredVehicleInfo? get info => _info;
  bool get isLoading => _isLoading;

  final PoweredVehicleInfoRepository _repository = PoweredVehicleInfoRepository();

  Future<void> loadPoweredVehicleInfo(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _info = await _repository.fetchPoweredVehicleInfo(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
