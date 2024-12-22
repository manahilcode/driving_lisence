import 'package:flutter/material.dart';

import '../model/meeting_standard.dart';
import '../repo/meeting_standard.dart';

class MotorwaySafetyNotifier extends ChangeNotifier {
  MeetingStandardRiding? _motorwaySafety;
  bool _isLoading = false;
  String _error = '';

  MeetingStandardRiding? get motorwaySafety => _motorwaySafety;
  bool get isLoading => _isLoading;
  String get error => _error;

  final MotorwaySafetyRepositoryRiding _repository;

  MotorwaySafetyNotifier(this._repository);

  // Fetch motorway safety data
  Future<void> fetchMotorwaySafety() async {
    _isLoading = true;
    notifyListeners();

    try {
      _motorwaySafety = await _repository.getMotorwaySafety();
    } catch (e) {
      _error = 'Failed to load data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
