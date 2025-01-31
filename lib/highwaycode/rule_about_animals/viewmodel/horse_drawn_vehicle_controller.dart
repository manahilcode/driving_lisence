import 'package:flutter/material.dart';

import '../model/horse_drawn_vehicle_model.dart';
import '../repo/horse_drawn_vehicle_repo.dart';

class HorseDrawnVehiclesProvider with ChangeNotifier {
  final HorseDrawnVehiclesRepository _repository = HorseDrawnVehiclesRepository();
  HorseDrawnVehiclesModel? _horseDrawnVehiclesData;
  bool _isLoading = false;
  String _errorMessage = '';

  HorseDrawnVehiclesModel? get horseDrawnVehiclesData => _horseDrawnVehiclesData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHorseDrawnVehiclesData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _horseDrawnVehiclesData = await _repository.fetchHorseDrawnVehiclesData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
