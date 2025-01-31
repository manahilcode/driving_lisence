import 'package:flutter/material.dart';
import '../model/joining_the_motorway_model.dart';
import '../repo/joining_the_motorway_repo.dart';

class JoiningMotorwayProvider extends ChangeNotifier {
  final JoiningMotorwayRepository _repository = JoiningMotorwayRepository();

  JoiningMotorwayModel? _joiningMotorwayData;
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  JoiningMotorwayModel? get joiningMotorwayData => _joiningMotorwayData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore
  Future<void> loadJoiningMotorwayData(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _repository.fetchJoiningMotorwayData(collection, document);

      if (data != null) {
        _joiningMotorwayData = data;
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
