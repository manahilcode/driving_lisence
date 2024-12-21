import 'package:flutter/material.dart';

import '../model/vulnurable_road_user.dart';
import '../repo/vulnurable_road_user_Repo.dart'; // Replace with correct path

class VulnerableRoadUserProvider with ChangeNotifier {
  final VulnerableRoadUserRepository _repository;
  VulnerableRoadUser12? _data;
  bool _isLoading = false;
  String? _errorMessage;

  VulnerableRoadUser12? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  VulnerableRoadUserProvider(this._repository);

  // Fetch data from the repository
  Future<void> fetchVulnerableRoadUserData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchVulnerableRoadUserData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
