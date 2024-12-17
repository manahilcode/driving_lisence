import 'package:flutter/foundation.dart';
import '../model/hazard_models.dart';
import '../repo/hazard_repo.dart';

class MotorcycleHazardProvider with ChangeNotifier {
  final MotorcycleHazardRepository _repository = MotorcycleHazardRepository();

  MotorcycleHazard? _motorcycleHazard;

  MotorcycleHazard? get motorcycleHazard => _motorcycleHazard;

  // Function to fetch data using the repository
  Future<void> fetchMotorcycleHazard(String collectionName, String docName) async {
    try {
      // Calling the fetch function in the repository
      _motorcycleHazard = await _repository.fetchMotorcycleHazard(collectionName, docName);
    } catch (e) {
      print("Error in provider while fetching data: $e");
      _motorcycleHazard = null;
    }
    notifyListeners(); // Notify listeners after fetching data
  }
}
