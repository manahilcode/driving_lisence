import 'package:flutter/material.dart';

import '../model/mobile_phone_vehicle_technology_model.dart';
import '../repo/mobile_phone_vehicle_technology_repo.dart';

class MobilePhonesProvider extends ChangeNotifier {
  final MobilePhonesRepository _repository = MobilePhonesRepository();

  MobilePhonesAndInVehicleTechnology? _mobilePhonesData;
  MobilePhonesAndInVehicleTechnology? get mobilePhonesData => _mobilePhonesData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _mobilePhonesData = await _repository.fetchMobilePhonesData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
