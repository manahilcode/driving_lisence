import 'package:flutter/material.dart';

import '../model/other_type_vehicle_model.dart';
import '../repo/other_type_vehicle_repo.dart';

class OtherVehicleNotifier extends ChangeNotifier {
  OtherVehicleInfo1? _info;
  bool _isLoading = false;

  OtherVehicleInfo1? get info => _info;
  bool get isLoading => _isLoading;

  final OtherVehicleRepository1 _repository = OtherVehicleRepository1();

  Future<void> loadOtherVehicleInfo(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _info = await _repository.fetchOtherVehicleInfo(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
