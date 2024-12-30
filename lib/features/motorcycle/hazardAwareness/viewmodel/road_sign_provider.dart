import 'package:flutter/material.dart';
import '../model/road_sign_model.dart';
import '../repo/road_sign_repo.dart';

class RoadSignsProvider extends ChangeNotifier {
  final RoadSignsRepository repository;
  RoadSigns? _items;
  bool _isLoading = true;

  RoadSignsProvider(this.repository);

  RoadSigns? get items => _items!;
  bool get isLoading => _isLoading;

  // Method to load data from the repository
  Future<void> loadRoadSigns() async {
    try {
      _isLoading = true;

      final fetchedItems = await repository.fetchRoadSigns();
      _items = fetchedItems;
      notifyListeners();  // Notify listeners about the loading state
    } catch (e) {
      // Handle error
      print("Error loading road signs: $e");
      _items = _items;  // Optionally handle the error state
    } finally {
      _isLoading = false;
      notifyListeners();  // Notify listeners after data is fetched
    }
  }
}
