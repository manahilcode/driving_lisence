import 'package:flutter/material.dart';

import '../model/wet_weather_model.dart';
import '../repo/wet_weather_repo.dart';

class HighwayWetWeatherProvider extends ChangeNotifier {
  HighwayWetWeather? _highwayWetWeatherData;
  bool _isLoading = true;
  String _errorMessage = '';

  // Getters for state management
  HighwayWetWeather? get highwayWetWeatherData => _highwayWetWeatherData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from the repository
  Future<void> fetchHighwayWetWeatherData() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners about the loading state

    try {
      _highwayWetWeatherData = await HighwayWetWeatherRepository().fetchHighwayWetWeatherData();
      _errorMessage = ''; // Clear any error message
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about the state change
    }
  }
}
