import 'package:flutter/material.dart';

import '../model/lighting_requirement_model.dart';
import '../repo/lighting_requirement_repo.dart';

class LightingRequirementProvider extends ChangeNotifier {
  LightingRequirement? _lightingRequirementData;
  bool _isLoading = true;
  String _errorMessage = '';

  LightingRequirement? get lightingRequirementData => _lightingRequirementData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchLightingRequirementData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _lightingRequirementData = await LightingRequirementRepository().fetchLightingRequirementData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
