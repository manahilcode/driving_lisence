import 'package:flutter/material.dart';
import '../model/things_discuss_trainer.dart';
import '../repo/things_discuss_trainer_repo.dart';

class HazardAwarenessDiscussProvider extends ChangeNotifier {
  final HazardAwarenessThingsDiscussRepository repository;
  HazardAwarenessThingsDiscuss? _hazardAwareness;
  bool _isLoading = true;

  HazardAwarenessDiscussProvider(this.repository);

  HazardAwarenessThingsDiscuss? get hazardAwareness => _hazardAwareness;
  bool get isLoading => _isLoading;

  // Method to load hazard awareness data
  Future<void> loadHazardAwareness() async {
    try {
      _isLoading = true;
      notifyListeners();  // Notify listeners about the loading state
      final fetchedData = await repository.fetchHazardAwareness();
      _hazardAwareness = fetchedData;
    } catch (e) {
      // Handle error
      print("Error loading hazard awareness data: $e");
      _hazardAwareness = null;  // Optionally handle error state
    } finally {
      _isLoading = false;
      notifyListeners();  // Notify listeners after data is fetched
    }
  }
}
