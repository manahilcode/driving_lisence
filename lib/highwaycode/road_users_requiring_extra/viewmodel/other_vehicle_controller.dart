import 'package:flutter/material.dart';

import '../model/other_vehicle_model.dart';
import '../repo/other_vehicle_repo.dart';

class HighwayOtherVehiclesProvider with ChangeNotifier {
  final HighwayOtherVehiclesRepository _repository = HighwayOtherVehiclesRepository();
  HighwayOtherVehiclesModel? _highwayOtherVehiclesData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayOtherVehiclesModel? get highwayOtherVehiclesData => _highwayOtherVehiclesData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayOtherVehiclesData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayOtherVehiclesData = await _repository.fetchHighwayOtherVehiclesData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
