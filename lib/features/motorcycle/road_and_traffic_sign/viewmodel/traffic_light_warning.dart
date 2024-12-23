import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/traffic_lights_warning.dart';
import '../repo/traffic_ligths_warning.dart';

class TrafficLightsWarningNotifier extends ChangeNotifier {
  final TrafficLightsWarningRepository _repository;

  TrafficLightsWarningNotifier(this._repository);

  // State variables
  TrafficLightsWarning? _trafficLightsWarning;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  TrafficLightsWarning? get trafficLightsWarning => _trafficLightsWarning;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Method to fetch data
  Future<void> fetchTrafficLightsWarning(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _trafficLightsWarning = await _repository.fetchTrafficLightsWarning(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
