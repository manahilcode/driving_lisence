import 'package:flutter/material.dart';
import '../model/general_model.dart';
import '../repo/general_repo.dart';

class HighwayGeneralProvider extends ChangeNotifier {
  final HighwayGeneralRepository _repository = HighwayGeneralRepository();

  HighwayGeneralModel? _highwayGeneralData;
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  HighwayGeneralModel? get highwayGeneralData => _highwayGeneralData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore
  Future<void> loadHighwayGeneralData(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _repository.fetchHighwayGeneral(collection, document);

      if (data != null) {
        _highwayGeneralData = data;
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
