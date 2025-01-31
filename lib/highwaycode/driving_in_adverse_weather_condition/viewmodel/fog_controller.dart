import 'package:flutter/material.dart';

import '../model/fog_model.dart';
import '../repo/fog_repo.dart';

class FogProvider with ChangeNotifier {
  final HighwayFogRepository _repository = HighwayFogRepository();

  HighwayFog? _data;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayFog? get data => _data;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore and update the state
  Future<void> fetchFogData(String documentId) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _data = await _repository.fetchFogData(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
