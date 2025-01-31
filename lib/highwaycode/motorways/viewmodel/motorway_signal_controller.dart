import 'package:flutter/material.dart';
import '../model/motorway_signal_model.dart';
import '../repo/motorway_signal_repo.dart';

class HighwayMotorwaySignalsProvider extends ChangeNotifier {
  final HighwayMotorwaySignalsRepository _repository = HighwayMotorwaySignalsRepository();

  HighwayMotorwaySignalsModel? _data;
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  HighwayMotorwaySignalsModel? get data => _data;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore
  Future<void> loadHighwayMotorwaySignalsData(
      String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _repository.fetchHighwayMotorwaySignalsData(collection, document);

      if (result != null) {
        _data = result;
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
