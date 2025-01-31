import 'package:flutter/material.dart';

import '../model/overtaking_model.dart';
import '../repo/overtaking_repo.dart';

class HighwayOvertakingProvider11 with ChangeNotifier {
  final HighwayOvertakingRepository1 _repository = HighwayOvertakingRepository1();
  HighwayOvertakingModel? _highwayOvertakingData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayOvertakingModel? get highwayOvertakingData => _highwayOvertakingData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayOvertakingData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayOvertakingData = await _repository.fetchHighwayOvertakingData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
