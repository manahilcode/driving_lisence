import 'package:flutter/material.dart';
import '../model/think_about.dart';
import '../repo/think_About.dart';
import 'think_about.dart';

class ThinkAboutNotifierSign extends ChangeNotifier {
  final ThinkAboutRepository _repository;
  ThinkAboutNotifierSign(this._repository);
  // State variables
  ThinkAboutSign? _thinkAbout;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  ThinkAboutSign? get thinkAbout => _thinkAbout;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Method to fetch data
  Future<void> fetchThinkAbout(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _thinkAbout = await _repository.fetchThinkAbout(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
