import 'package:flutter/material.dart';

import '../model/keep_warm_model.dart';
import '../repo/keep_warm_repo.dart';

class KeepingWarmProvider extends ChangeNotifier {
  final KeepingWarmRepository _repository = KeepingWarmRepository();

  KeepingWarmModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  KeepingWarmModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchKeepingWarmData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchKeepingWarmData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
