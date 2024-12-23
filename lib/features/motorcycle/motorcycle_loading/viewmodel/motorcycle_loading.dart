import 'package:flutter/material.dart';

import '../model/motorcycle_loading.dart';
import '../repo/motorcycle_loading.dart';

class MotorcycleLoadingNotifier extends ChangeNotifier {
  final MotorcycleLoadingRepository repository;

  MotorcycleLoadingModel? _motorcycleLoading;
  bool _isLoading = false;
  String? _errorMessage;

  MotorcycleLoadingModel? get motorcycleLoading => _motorcycleLoading;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  MotorcycleLoadingNotifier({required this.repository});

  Future<void> loadMotorcycleLoading(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _motorcycleLoading = await repository.fetchMotorcycleLoading(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
