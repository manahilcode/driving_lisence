import 'package:flutter/material.dart';

import '../model/riding_model.dart';
import '../repo/riding_repo.dart';

class HighwayCodeRidingProvider with ChangeNotifier {
  final HighwayCodeRidingRepository _repository = HighwayCodeRidingRepository();
  HighwayCodeRidingModel? _highwayCodeRidingData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayCodeRidingModel? get highwayCodeRidingData => _highwayCodeRidingData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayCodeRidingData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayCodeRidingData = await _repository.fetchHighwayCodeRidingData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
