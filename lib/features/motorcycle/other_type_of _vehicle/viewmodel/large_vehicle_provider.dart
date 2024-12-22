import 'package:flutter/material.dart';
import '../model/large_vehicle_info.dart';
import '../repo/large_vehicle_repo.dart';

class LargeVehicleNotifier extends ChangeNotifier {
  LargeVehicleInfo? _info;
  bool _isLoading = false;

  LargeVehicleInfo? get info => _info;
  bool get isLoading => _isLoading;

  final LargeVehicleRepository _repository = LargeVehicleRepository();

  Future<void> loadLargeVehicleInfo(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _info = await _repository.fetchLargeVehicleInfo(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
