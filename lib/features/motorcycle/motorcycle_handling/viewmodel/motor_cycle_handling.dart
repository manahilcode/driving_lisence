import 'package:flutter/material.dart';

import '../model/motorcycle_handling.dart';
import '../repo/motorcycle_handling.dart';

class MotorcycleHandlingNotifier extends ChangeNotifier {
  MotorcycleHandling? _data;
  bool _isLoading = false;

  MotorcycleHandling? get data => _data;
  bool get isLoading => _isLoading;

  final MotorcycleHandlingRepository _repository = MotorcycleHandlingRepository();

  Future<void> loadMotorcycleHandling(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _data = await _repository.fetchMotorcycleHandling(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
