import 'package:flutter/material.dart';

import '../model/junction_controlled_by_traffic_lights_model.dart';
import '../repo/junction_controlled_by_traffic_lights_repo.dart';

class JunctionsControlledByTrafficLightsProvider extends ChangeNotifier {
  JunctionsControlledByTrafficLights? _junctionsData;
  bool _isLoading = true;
  String _errorMessage = '';

  JunctionsControlledByTrafficLights? get junctionsData => _junctionsData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchJunctionsData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _junctionsData = await JunctionsControlledByTrafficLightsRepository().fetchJunctionsData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

