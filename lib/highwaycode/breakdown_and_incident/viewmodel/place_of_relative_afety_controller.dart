import 'package:flutter/material.dart';

import '../model/place_of_relative_afety_model.dart';
import '../repo/place_of_relative_afety_repo.dart';

class PlaceOfRelativeSafetyProvider with ChangeNotifier {
  final PlaceOfRelativeSafetyRepository _repository = PlaceOfRelativeSafetyRepository();

  PlaceOfRelativeSafety? _placeOfRelativeSafety;
  bool _isLoading = false;
  String _errorMessage = '';

  PlaceOfRelativeSafety? get placeOfRelativeSafety => _placeOfRelativeSafety;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore
  Future<void> fetchPlaceOfRelativeSafety(String documentId) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _placeOfRelativeSafety = await _repository.fetchPlaceOfRelativeSafety(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
