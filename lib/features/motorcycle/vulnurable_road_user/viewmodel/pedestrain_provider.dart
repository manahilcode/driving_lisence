import 'package:flutter/material.dart';

import '../model/pedestrain_model.dart';
import '../repo/pedestrain_repo.dart'; // Replace with the correct path

class PedestrianProvider with ChangeNotifier {
  final PedestrianRepositoryVal _repository;
  PedestrianVal? _data;
  bool _isLoading = false;
  String? _errorMessage;

  PedestrianVal? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  PedestrianProvider(this._repository);

  // Fetch data from the repository
  Future<void> fetchPedestrianData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchPedestrianData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
