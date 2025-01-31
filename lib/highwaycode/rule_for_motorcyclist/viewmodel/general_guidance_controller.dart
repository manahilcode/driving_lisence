import 'package:flutter/material.dart';

import '../../introduction/model/wording_of_highway_code_model.dart';
import '../../introduction/repo/wording_of_highway_code_repo.dart';
import '../model/general_guidance_model.dart';
import '../repo/general_guidance_repo.dart';

class HighwayCodeGeneralGuidanceProvider extends ChangeNotifier {
  HighwayCodeGeneralGuidance? _guidance;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayCodeGeneralGuidance? get guidance => _guidance;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final HighwayCodeRepository11 _repository = HighwayCodeRepository11();

  // Method to fetch data
  Future<void> fetchGuidance() async {
    _isLoading = true;
    notifyListeners();

    try {
      _guidance = await _repository.fetchGuidance();
      if (_guidance == null) {
        _errorMessage = "No data found";
      }
    } catch (e) {
      _errorMessage = "Error: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
