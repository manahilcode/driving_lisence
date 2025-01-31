import 'package:flutter/material.dart';

import '../model/parking_model.dart';
import '../repo/parking_repo.dart';

class HighwayParkingProvider with ChangeNotifier {
  final HighwayParkingRepository _repository = HighwayParkingRepository();

  HighwayParking? _highwayParkingData;
  bool _isLoading = false;
  String? _errorMessage;

  HighwayParking? get highwayParkingData => _highwayParkingData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchHighwayParking() async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayParkingData = await _repository.fetchHighwayParkingData();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
