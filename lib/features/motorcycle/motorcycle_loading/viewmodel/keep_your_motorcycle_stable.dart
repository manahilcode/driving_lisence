import 'package:flutter/material.dart';

import '../model/keep_your_motorcycle_stable.dart';
import '../repo/keep_your_motorcycle_stable.dart';

class MotorcycleStabilityNotifier extends ChangeNotifier {
  final MotorcycleStabilityRepository repository;

  MotorcycleStabilityModel? _motorcycleStability;
  bool _isLoading = false;
  String? _errorMessage;

  MotorcycleStabilityModel? get motorcycleStability => _motorcycleStability;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  MotorcycleStabilityNotifier({required this.repository});

  Future<void> loadMotorcycleStability(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _motorcycleStability = await repository.fetchMotorcycleStability(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
