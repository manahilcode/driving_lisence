import 'package:flutter/material.dart';

import '../model/stay_focus_model.dart';
import '../repo/stay_focus_repo.dart';

class StayFocusProvider extends ChangeNotifier {
  final StayFocusRepo _repository = StayFocusRepo();

  StayFocusModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  StayFocusModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchFocusedRidingData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchFocusedRidingData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
