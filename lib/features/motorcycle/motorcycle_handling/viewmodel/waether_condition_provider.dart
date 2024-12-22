import 'package:flutter/material.dart';

import '../model/weather_Condition.dart';
import '../repo/waether_condition.dart';

class WeatherConditionsNotifier extends ChangeNotifier {
  WeatherConditionsHandling? _data;
  bool _isLoading = false;

  WeatherConditionsHandling? get data => _data;
  bool get isLoading => _isLoading;

  final WeatherConditionsRepositoryHandling _repository = WeatherConditionsRepositoryHandling();

  Future<void> loadWeatherConditions(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _data = await _repository.fetchWeatherConditions(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
