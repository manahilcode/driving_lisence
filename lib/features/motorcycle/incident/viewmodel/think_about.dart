import 'package:flutter/material.dart';

import '../model/think_about.dart';
import '../repo/think_about.dart';

class ThinkAboutNotifier extends ChangeNotifier {
  final ThinkAboutRepositoryIncident repository;

  ThinkAboutModelIncident? _thinkAbout;
  bool _isLoading = false;
  String? _errorMessage;

  ThinkAboutModelIncident? get thinkAbout => _thinkAbout;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  ThinkAboutNotifier({required this.repository});

  Future<void> loadThinkAbout(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _thinkAbout = await repository.fetchThinkAbout(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
