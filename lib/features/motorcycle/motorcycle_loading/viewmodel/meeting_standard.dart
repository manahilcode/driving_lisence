import 'package:flutter/material.dart';

import '../model/meeting_standard.dart';
import '../repo/meeting_standard.dart';

class MotorcyclePassengerNotifier extends ChangeNotifier {
  final MotorcyclePassengerRepository repository;

  MeetingStandardModel11? _motorcyclePassenger;
  bool _isLoading = false;
  String? _errorMessage;

  MeetingStandardModel11? get motorcyclePassenger => _motorcyclePassenger;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  MotorcyclePassengerNotifier({required this.repository});

  Future<void> loadMotorcyclePassenger(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _motorcyclePassenger = await repository.fetchMotorcyclePassenger(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
