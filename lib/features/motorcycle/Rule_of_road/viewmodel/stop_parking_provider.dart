// StoppingAndParkingNotifier
import 'package:flutter/material.dart';

import '../model/stop_parking_model.dart';
import '../repo/stop_parking.dart';

class StoppingAndParkingNotifier extends ChangeNotifier {
  final StoppingAndParkingRepository repository;
  StoppingAndParkingModel? _stoppingAndParking;
  bool _isLoading = false;
  String? _errorMessage;

  StoppingAndParkingNotifier({required this.repository});

  StoppingAndParkingModel? get stoppingAndParking => _stoppingAndParking;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadStoppingAndParking(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _stoppingAndParking = await repository.fetchStoppingAndParking(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}