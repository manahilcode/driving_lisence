import 'package:flutter/material.dart';

import '../model/fuel_efficient_riding_model.dart';
import '../repo/fuel_efficient_riding_repo.dart';

class NoisePollutionProvider extends ChangeNotifier {
  final NoisePollutionRepository _repository = NoisePollutionRepository();

  NoisePollutionModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  NoisePollutionModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
