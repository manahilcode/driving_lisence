import 'package:flutter/material.dart';
import '../model/leaving_the_motorway_model.dart';
import '../repo/leaving_the_motorway_repo.dart';

class LeavingMotorwayProvider extends ChangeNotifier {
  final LeavingMotorwayRepository _repository = LeavingMotorwayRepository();

  LeavingMotorwayModel? _leavingMotorwayData;
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  LeavingMotorwayModel? get leavingMotorwayData => _leavingMotorwayData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore
  Future<void> loadLeavingMotorwayData(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _repository.fetchLeavingMotorwayData(collection, document);

      if (data != null) {
        _leavingMotorwayData = data;
        _errorMessage = '';
      } else {
        _errorMessage = 'No data found.';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
