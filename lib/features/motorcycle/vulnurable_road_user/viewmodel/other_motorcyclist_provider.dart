import 'package:flutter/material.dart';
import '../model/other_Motorcyclist.dart';
import '../repo/other_motorcylist_repo.dart'; // Replace with the correct path

class OtherMotorcyclistsProvider with ChangeNotifier {
  final OtherMotorcyclistsRepository _repository;
  OtherMotorcyclists? _data;
  bool _isLoading = false;
  String? _errorMessage;

  OtherMotorcyclists? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  OtherMotorcyclistsProvider(this._repository);

  // Fetch data from the repository
  Future<void> fetchOtherMotorcyclistsData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchOtherMotorcyclistsData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
