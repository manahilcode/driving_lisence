import 'package:flutter/material.dart';

import '../model/icy_and_snowy_waether_model.dart';
import '../repo/icy_and_snowy_waether_repo.dart';

class IcySnowyWeatherProvider with ChangeNotifier {
  final IcySnowyWeatherRepository _repository = IcySnowyWeatherRepository();

  IcySnowyWeather? _data;
  bool _isLoading = false;
  String _errorMessage = '';

  IcySnowyWeather? get data => _data;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore
  Future<void> fetchIcySnowyWeather(String documentId) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _data = await _repository.fetchIcySnowyWeather(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
