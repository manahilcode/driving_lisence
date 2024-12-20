import 'package:flutter/material.dart';

import '../model/safetly_motorcycle.dart';
import '../repo/safetly_motorcycle_repo.dart';

class SafetyYourMotorcycleNotifier extends ChangeNotifier {
  SafetyYourMotorcycle? _safetyYourMotorcycleData;

  SafetyYourMotorcycle? get safetyYourMotorcycleData => _safetyYourMotorcycleData;

  // Fetch the SafetyYourMotorcycle data from the repository
  Future<void> fetchData() async {
    try {
      SafetyYourMotorcycleRepository repository = SafetyYourMotorcycleRepository();
      _safetyYourMotorcycleData = await repository.getSafetyYourMotorcycleData();
      notifyListeners();
    } catch (e) {
      // Handle error, you can also add error message state
      print("Error fetching data: $e");
    }
  }
}
