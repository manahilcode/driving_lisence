import 'package:flutter/material.dart';

import '../model/pedistrain_crossing_model.dart';
import '../repo/pedistrain_crossing_repo.dart';

class CrossingProviderAttitudeMotorcycle extends ChangeNotifier {
  final CrossingRepository _repository = CrossingRepository();

  CrossingModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  CrossingModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCrossingData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchCrossingData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
