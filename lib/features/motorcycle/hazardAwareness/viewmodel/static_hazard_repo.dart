import 'package:flutter/material.dart';

import '../model/static_hazard_model.dart';
import '../repo/static_hazard_Repo.dart';

class StaticHazardProvider extends ChangeNotifier {
  final StaticHazardRepository repository;
  StaticHazard? _staticHazard;
  bool _isLoading = true;

  StaticHazardProvider(this.repository);

  StaticHazard? get staticHazard => _staticHazard;
  bool get isLoading => _isLoading;

  // Method to load static hazard data
  Future<void> loadStaticHazard() async {
    try {
      _isLoading = true;
      notifyListeners();  // Notify listeners about the loading state
      final fetchedData = await repository.fetchStaticHazard();
      _staticHazard = fetchedData;
    } catch (e) {
      // Handle error
      print("Error loading static hazard: $e");
      _staticHazard = null;  // Optionally handle error state
    } finally {
      _isLoading = false;
      notifyListeners();  // Notify listeners after data is fetched
    }
  }
}
