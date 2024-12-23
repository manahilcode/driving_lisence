import 'package:flutter/material.dart';

import '../model/motor_cycle_licence.dart';
import '../repo/motor_cycle_licence.dart';

class MotorcycleLicenceProvider with ChangeNotifier {
  final MotorcycleLicenceRepository _repository = MotorcycleLicenceRepository();

  MotorcycleLicence? _motorcycleLicence;
  MotorcycleLicence? get motorcycleLicence => _motorcycleLicence;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchMotorcycleLicence() async {
    _isLoading = true;
    notifyListeners();

    try {
      _motorcycleLicence = await _repository.fetchMotorcycleLicence();
    } catch (e) {
      // Handle error (could show a message)
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
