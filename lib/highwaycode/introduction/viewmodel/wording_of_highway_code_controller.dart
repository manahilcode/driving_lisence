
import 'package:flutter/material.dart';

import '../../rule_for_pedestrain/repo/general_guidance_repo.dart';
import '../model/wording_of_highway_code_model.dart';
import '../repo/wording_of_highway_code_repo.dart';

class HighwayCodeProvider123 extends ChangeNotifier {
  final HighwayCodeRepository1123 _repository = HighwayCodeRepository1123();

  WordingOfHighwayCodeModel11? _highwayCodeData;
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  WordingOfHighwayCodeModel11? get highwayCodeData => _highwayCodeData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore
  Future<void> loadHighwayCodeData(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _repository.fetchHighwayCodeData(collection, document);

      if (data != null) {
        _highwayCodeData = data;
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
