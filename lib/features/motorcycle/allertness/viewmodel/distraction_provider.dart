import 'package:flutter/material.dart';
import '../repo/distraction_repo.dart';
import '../model/distraction_model.dart';

class DistractionProvider extends ChangeNotifier {
  final DistractionRepository _repository = DistractionRepository();

  DistractionModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  DistractionModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchDistractionData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchDistractionData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
