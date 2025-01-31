import 'package:flutter/foundation.dart';

import '../model/powered_wheelchair_mobility_scooter_model.dart';
import '../repo/powered_wheelchair_mobility_scooter_repo.dart';

class PoweredWheelchairsAndMobilityScootersProvider with ChangeNotifier {
  final PoweredWheelchairsAndMobilityScootersRepo _repo = PoweredWheelchairsAndMobilityScootersRepo();
  PoweredWheelchairsAndMobilityScooters? _data;
  bool _isLoading = false;
  String _errorMessage = '';

  PoweredWheelchairsAndMobilityScooters? get data => _data;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchPoweredWheelchairsData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repo.getPoweredWheelchairsData();
      _errorMessage = '';
    } catch (e) {
      _data = null;
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
