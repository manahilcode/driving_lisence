import 'package:flutter/material.dart';

import '../model/hot_weather_model.dart';
import '../repo/hot_weather_repo.dart';

class HotWeatherProvider with ChangeNotifier {
  final HotWeatherRepository _repository = HotWeatherRepository();

  HighWayHotWeather? _data;
  bool _isLoading = false;
  String _errorMessage = '';

  HighWayHotWeather? get data => _data;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore and update the state
  Future<void> fetchHotWeatherData(String documentId) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _data = await _repository.fetchHotWeatherData(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
