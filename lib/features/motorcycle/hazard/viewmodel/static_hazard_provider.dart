import 'package:flutter/cupertino.dart';

import '../model/hazard_models.dart';
import '../repo/static_hazard_repo.dart';

class MotorcycleStaticHazardProvider with ChangeNotifier {
  final MotorcycleStaticHazardRepository _repository = MotorcycleStaticHazardRepository();

  MotorcycleStaticHazard? _motorcycleStaticHazard;
  bool _isLoading = false;
  String? _error;

  MotorcycleStaticHazard? get motorcycleStaticHazard => _motorcycleStaticHazard;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Set loading state
  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  // Set the fetched motorcycle static hazard
  void setMotorcycleStaticHazard(MotorcycleStaticHazard? hazard) {
    _motorcycleStaticHazard = hazard;
    notifyListeners();
  }

  // Set error state
  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  // Fetch a motorcycle static hazard by collection name and doc name
  Future<void> fetchMotorcycleStaticHazard(String collectionName, String docName) async {
    setLoading(true);
    try {
      final hazard = await _repository.fetchMotorcycleStaticHazard(collectionName, docName);
      if (hazard != null) {
        setMotorcycleStaticHazard(hazard);
      } else {
        setError('Hazard not found.');
      }
    } catch (e) {
      setError('Error fetching motorcycle hazard: $e');
    } finally {
      setLoading(false);
    }
  }
}