import 'package:flutter/material.dart';

import '../model/country_road_model.dart';
import '../repo/country_road_repo.dart';

class CountryRoadsProvider extends ChangeNotifier {
  HighwayCountryRoads? _countryRoadsData;
  bool _isLoading = true;
  String _errorMessage = '';

  // Getters for the state
  HighwayCountryRoads? get countryRoadsData => _countryRoadsData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from the repository
  Future<void> fetchCountryRoadsData() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners that loading has started

    try {
      _countryRoadsData = await HighwayCountryRoadsRepository().fetchCountryRoadsData();
      _errorMessage = ''; // Clear any previous error messages
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about state change
    }
  }
}
