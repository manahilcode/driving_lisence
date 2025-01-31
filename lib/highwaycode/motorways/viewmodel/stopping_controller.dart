import 'package:flutter/material.dart';

import '../model/stopping_model.dart';
import '../repo/stopping_repo.dart';

class HighwayStoppingProvider with ChangeNotifier {
  final HighwayStoppingRepository _repository = HighwayStoppingRepository();
  HighwayStoppingModel? _highwayStoppingData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayStoppingModel? get highwayStoppingData => _highwayStoppingData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayStoppingData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayStoppingData = await _repository.fetchHighwayStoppingData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
