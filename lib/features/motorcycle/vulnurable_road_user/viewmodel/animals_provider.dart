import 'package:flutter/material.dart';

import '../model/animals.dart';
import '../repo/animals_Repo.dart';

class AnimalVulnerableUserProvider with ChangeNotifier {
  final AnimalVulnerableUserRepository _repository;
  AnimalVulnerableUser? _data;
  bool _isLoading = false;
  String? _errorMessage;

  AnimalVulnerableUser? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AnimalVulnerableUserProvider(this._repository);

  // Fetch data from the repository
  Future<void> fetchAnimalVulnerableUserData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchAnimalVulnerableUserData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
