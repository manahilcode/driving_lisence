import 'package:flutter/material.dart';

import '../model/registor_owing.dart';
import '../repo/registor_owing.dart';

class MotorcycleInfoProvider with ChangeNotifier {
  final MotorcycleInfoRepository _repository = MotorcycleInfoRepository();

  RegistorOwing? _motorcycleInfo;
  RegistorOwing? get motorcycleInfo => _motorcycleInfo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchMotorcycleInfo() async {
    _isLoading = true;
    notifyListeners();

    try {
      _motorcycleInfo = await _repository.fetchMotorcycleInfo();
    } catch (e) {
      // Handle error (could show a message)
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
