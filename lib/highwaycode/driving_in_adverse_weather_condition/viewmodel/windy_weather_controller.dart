import 'package:flutter/material.dart';

import '../../../features/vehicle_handling/pages/windy_weather.dart';
import '../model/windy_weather_model.dart';
import '../repo/windy_weather_repo.dart';

class WindyWeatherProvider extends ChangeNotifier {
  WindyWeatherModelWindyWeather? _windyWeatherData;
  bool _isLoading = true;
  String _errorMessage = '';

  // Getters for state management
  WindyWeatherModelWindyWeather? get windyWeatherData => _windyWeatherData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from the repository
  Future<void> fetchWindyWeatherData() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners about the loading state

    try {
      _windyWeatherData = await HighwayWindyWeatherRepository().fetchWindyWeatherData();
      _errorMessage = ''; // Clear any error message
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about the state change
    }
  }
}
