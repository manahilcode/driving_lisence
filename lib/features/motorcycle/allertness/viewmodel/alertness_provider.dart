import 'package:flutter/material.dart';

import '../model/allertness_model.dart';
import '../repo/allertness_repo.dart';

class AlertnessNotifier extends ChangeNotifier {
  final AlertnessRepository _repository;
  AlertnessData? _alertnessData;
  bool _isLoading = false;
  String? _error;

  AlertnessNotifier(this._repository);

  AlertnessData? get alertnessData => _alertnessData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadAlertnessData(String collection, String document) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _alertnessData = await _repository.fetchAlertnessData(collection, document);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
