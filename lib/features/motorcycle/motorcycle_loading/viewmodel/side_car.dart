import 'package:flutter/material.dart';

import '../model/side_car.dart';
import '../repo/side_car.dart';

class PillionPassengerNotifier extends ChangeNotifier {
  final PillionPassengerRepository repository;

  PillionPassengerModel? _pillionPassenger;
  bool _isLoading = false;
  String? _errorMessage;

  PillionPassengerModel? get pillionPassenger => _pillionPassenger;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  PillionPassengerNotifier({required this.repository});

  Future<void> loadPillionPassenger(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _pillionPassenger = await repository.fetchPillionPassenger(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
