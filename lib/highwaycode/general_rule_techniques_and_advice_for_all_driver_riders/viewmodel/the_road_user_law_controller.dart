// Provider class for TheRoadUserAndTheLaw
import 'package:flutter/material.dart';

import '../model/the_road_user_law_model.dart';
import '../repo/the_road_user_law_repo.dart';

class TheRoadUserAndTheLawProvider extends ChangeNotifier {
  final TheRoadUserAndTheLawRepository _repository = TheRoadUserAndTheLawRepository();

  TheRoadUserAndTheLaw? _theRoadUserAndTheLaw;
  TheRoadUserAndTheLaw? get theRoadUserAndTheLaw => _theRoadUserAndTheLaw;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchTheRoadUserAndTheLaw(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _theRoadUserAndTheLaw = await _repository.fetchTheRoadUserAndTheLawData(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}