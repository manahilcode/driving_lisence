import 'package:flutter/material.dart';

import '../model/bad_weather.dart';
import '../repo/bad_weather.dart';

class WeatherConditionsNotifier extends ChangeNotifier {
  WeatherBadConditions? _data;
  bool _isLoading = false;

  WeatherBadConditions? get data => _data;
  bool get isLoading => _isLoading;

  final WeatherConditionsRepository _repository = WeatherConditionsRepository();

  Future<void> loadWeatherConditions(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _data = await _repository.fetchWeatherConditions(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
