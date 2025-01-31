import 'package:flutter/material.dart';

import '../model/fitness_to_drive_model.dart';
import '../repo/fitness_to_drive_repo.dart';

class FitnessToDriveProvider with ChangeNotifier {
  final FitnessToDriveRepository _repository = FitnessToDriveRepository();
  FitnessToDriveModel? _fitnessToDriveData;
  bool _isLoading = false;
  String _errorMessage = '';

  FitnessToDriveModel? get fitnessToDriveData => _fitnessToDriveData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchFitnessToDriveData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _fitnessToDriveData = await _repository.fetchFitnessToDriveData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
