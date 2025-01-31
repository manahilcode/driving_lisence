import 'package:flutter/material.dart';

import '../model/self_driving_vehicle_model.dart';
import '../repo/self_driving_vehicle_repo.dart';

class SelfDrivingProvider extends ChangeNotifier {
  final SelfDrivingRepository _repository = SelfDrivingRepository();

  SelfDrivingModel? _selfDrivingData;
  bool _isLoading = false;
  String _errorMessage = '';

  SelfDrivingModel? get selfDrivingData => _selfDrivingData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore and notify listeners
  Future<void> loadSelfDrivingData(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _repository.fetchSelfDrivingData(collection, document);

      if (data != null) {
        _selfDrivingData = data;
        _errorMessage = '';
      } else {
        _errorMessage = 'Failed to load data.';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
