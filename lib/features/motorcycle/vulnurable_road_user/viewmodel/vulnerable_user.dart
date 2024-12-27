import 'package:flutter/material.dart';
import '../model/vulnurable_user.dart';
import '../repo/vulnurable_user.dart'; // Replace with the correct path

class VulnerableRoadUsersProvider1 with ChangeNotifier {
  final VulnerableRoadUsersRepositoryval _repository;
  VulnerableRoadUsersVal? _data;
  bool _isLoading = false;
  String? _errorMessage;

  VulnerableRoadUsersVal? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  VulnerableRoadUsersProvider1(this._repository);

  // Fetch data from the repository
  Future<void> fetchVulnerableRoadUsersData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchVulnerableRoadUsersData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
