import 'package:flutter/material.dart';

import '../model/on_the_motorway_model.dart';
import '../repo/on_the_motorway_repo.dart';

class HighwayMotorwayProvider with ChangeNotifier {
  final HighwayMotorwayRepository _repository = HighwayMotorwayRepository();
  HighwayMotorwayModel? _highwayMotorwayData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayMotorwayModel? get highwayMotorwayData => _highwayMotorwayData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayMotorwayData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayMotorwayData = await _repository.fetchHighwayMotorwayData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
