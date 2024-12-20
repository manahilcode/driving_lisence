import 'package:flutter/material.dart';

import '../model/parking_safety.dart';
import '../repo/parking_safetly_repo.dart';

class ParkingSafelyNotifier extends ChangeNotifier {
  ParkingSafely? _parkingSafelyData;

  ParkingSafely? get parkingSafelyData => _parkingSafelyData;

  // Fetch the ParkingSafely data from the repository
  Future<void> fetchData() async {
    try {
      ParkingSafelyRepository repository = ParkingSafelyRepository();
      _parkingSafelyData = await repository.getParkingSafelyData();
      notifyListeners();
    } catch (e) {
      // Handle error, you can also add error message state
      print("Error fetching data: $e");
    }
  }
}
