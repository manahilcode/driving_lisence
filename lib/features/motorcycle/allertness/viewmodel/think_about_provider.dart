import 'package:flutter/material.dart';
import '../model/think_about.dart';
import '../repo/think_repo.dart';

class ThinkAboutProviderAllert extends ChangeNotifier {
  final MotorcycleThinkAboutRepository _repository = MotorcycleThinkAboutRepository();

  ThinkAboutModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  ThinkAboutModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchThinkAboutData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchThinkAboutData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
