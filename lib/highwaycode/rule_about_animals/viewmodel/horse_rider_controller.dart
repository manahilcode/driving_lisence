import 'package:flutter/material.dart';

import '../model/horse_rider_model.dart';
import '../repo/horse_rider_repo.dart';

class HighwayHorseRidersProvider with ChangeNotifier {
  final HighwayHorseRidersRepository _repository = HighwayHorseRidersRepository();
  HighwayHorseRidersModel? _horseRidersData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayHorseRidersModel? get horseRidersData => _horseRidersData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayHorseRidersData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _horseRidersData = await _repository.fetchHighwayHorseRidersData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
