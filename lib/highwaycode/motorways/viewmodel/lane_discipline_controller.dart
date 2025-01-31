import 'package:flutter/material.dart';

import '../model/lane_discipline_model.dart';
import '../repo/lane_discipline_repo.dart';

class HighwayLaneDisciplineProvider extends ChangeNotifier {
  final HighwayLaneDisciplineRepository _repository = HighwayLaneDisciplineRepository();

  HighwayLaneDisciplineModel? _highwayLaneDisciplineData;
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  HighwayLaneDisciplineModel? get highwayLaneDisciplineData => _highwayLaneDisciplineData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore
  Future<void> loadHighwayLaneDisciplineData(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _repository.fetchHighwayLaneDisciplineData(collection, document);

      if (data != null) {
        _highwayLaneDisciplineData = data;
        _errorMessage = '';
      } else {
        _errorMessage = 'No data found.';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
