import 'package:flutter/material.dart';

import '../model/yourself.dart';
import '../repo/yourself_Repo.dart';

class AwarenessHazardProvider with ChangeNotifier {
  final AwarenessHazardRepository _repository;
  AwarenessHazardYourself? _data;
  bool _isLoading = false;
  String? _errorMessage;

  AwarenessHazardYourself? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AwarenessHazardProvider(this._repository);

  // Fetch data from the repository
  Future<void> fetchAwarenessHazardData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchAwarenessHazardData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
