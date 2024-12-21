import 'package:flutter/foundation.dart';

import '../model/weather_condition.dart';
import '../repo/weather_condition_repo.dart';

class WeatherConditionNotifier extends ChangeNotifier {
  WeatherConditionModel? _weatherConditionData;
  bool _isLoading = false;
  String _errorMessage = '';

  WeatherConditionModel? get weatherConditionData => _weatherConditionData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final WeatherConditionRepository _repository;

  WeatherConditionNotifier(this._repository);

  // Fetch weather condition data and notify listeners
  Future<void> fetchWeatherConditionData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _weatherConditionData = await _repository.fetchWeatherConditionData();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
