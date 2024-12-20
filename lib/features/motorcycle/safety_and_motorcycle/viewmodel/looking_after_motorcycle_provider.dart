import 'package:flutter/material.dart';

import '../model/looking_after_motorcycle_model.dart';
import '../repo/looking_after_motorcycle_repo.dart';

class MotorcycleMaintenanceNotifier extends ChangeNotifier {
  MotorcycleMaintenance? _maintenanceData;

  MotorcycleMaintenance? get maintenanceData => _maintenanceData;

  // Fetch data from Firebase
  Future<void> fetchData() async {
    try {
      MotorcycleMaintenanceRepository repository = MotorcycleMaintenanceRepository();
      _maintenanceData = await repository.getMotorcycleMaintenanceData();
      notifyListeners();
    } catch (e) {
      // Handle errors, e.g., show an error message
      print("Error fetching data: $e");
    }
  }
}
