// SpeedLimitsNotifier
import 'package:flutter/material.dart';

import '../model/speed_limit.dart';
import '../repo/speed_limit.dart';

class SpeedLimitsNotifier extends ChangeNotifier {
  final SpeedLimitsRepository repository;
  SpeedLimitsModel? _speedLimits;
  bool _isLoading = false;
  String? _errorMessage;

  SpeedLimitsNotifier({required this.repository});

  SpeedLimitsModel? get speedLimits => _speedLimits;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadSpeedLimits(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _speedLimits = await repository.fetchSpeedLimits(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
