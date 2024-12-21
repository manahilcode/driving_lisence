import 'package:flutter/material.dart';
import '../model/think_about_model.dart';
import '../repo/think_about_repo.dart';

class HazardAwarenessThinkAboutProvider extends ChangeNotifier {
  final HazardAwarenessThinkAboutRepository repository;
  HazardAwarenessThinkAbout? _hazardAwarenessThinkAbout;
  bool _isLoading = true;

  HazardAwarenessThinkAboutProvider(this.repository);

  HazardAwarenessThinkAbout? get hazardAwarenessThinkAbout => _hazardAwarenessThinkAbout;
  bool get isLoading => _isLoading;

  // Method to load hazard awareness "Think About" data
  Future<void> loadHazardAwarenessThinkAbout() async {
    try {
      _isLoading = true;
      notifyListeners();  // Notify listeners about the loading state
      final fetchedData = await repository.fetchHazardAwarenessThinkAbout();
      _hazardAwarenessThinkAbout = fetchedData;
    } catch (e) {
      // Handle error
      print("Error loading hazard awareness think about data: $e");
      _hazardAwarenessThinkAbout = null;  // Optionally handle error state
    } finally {
      _isLoading = false;
      notifyListeners();  // Notify listeners after data is fetched
    }
  }
}
