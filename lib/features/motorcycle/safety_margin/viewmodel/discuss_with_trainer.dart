import 'package:flutter/material.dart';

import '../model/discuss_with_trainer.dart';
import '../repo/discuss_with_trainer_repo.dart';

class SafetyMarginDiscussNotifier extends ChangeNotifier {
  final SafetyMarginDiscussRepository _repository;

  SafetyMarginDiscussModel? _data;
  bool _isLoading = false;
  String? _error;

  SafetyMarginDiscussNotifier(this._repository);

  SafetyMarginDiscussModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadSafetyMarginData(String collection, String document) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _data = await _repository.getSafetyMarginData(collection, document);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
