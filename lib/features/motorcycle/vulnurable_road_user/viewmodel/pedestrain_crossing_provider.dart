import 'package:flutter/material.dart';
import '../model/pedestrain_crossing_model.dart';
import '../repo/pedestrain_crossing_repo.dart'; // Replace with the correct path

class PedestrianCrossingProvider with ChangeNotifier {
  final PedestrianCrossingRepository _repository;
  PedestrianCrossingVul? _data;
  bool _isLoading = false;
  String? _errorMessage;

  PedestrianCrossingVul? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  PedestrianCrossingProvider(this._repository);

  // Fetch data from the repository
  Future<void> fetchPedestrianCrossingData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchPedestrianCrossingData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
