import 'package:flutter/material.dart';

import '../model/motorway_riding.dart';
import '../repo/motorway_Riding_repo.dart';

class MotorwayRidingNotifier extends ChangeNotifier {
  MotorwayRiding? _motorwayRiding;
  bool _isLoading = false;
  String _error = '';

  MotorwayRiding? get motorwayRiding => _motorwayRiding;
  bool get isLoading => _isLoading;
  String get error => _error;

  final MotorwayRidingRepository _repository;

  MotorwayRidingNotifier(this._repository);

  // Fetch motorway riding data
  Future<void> fetchMotorwayRiding() async {
    _isLoading = true;
    notifyListeners();

    try {
      _motorwayRiding = await _repository.getMotorwayRiding();
    } catch (e) {
      _error = 'Failed to load data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
