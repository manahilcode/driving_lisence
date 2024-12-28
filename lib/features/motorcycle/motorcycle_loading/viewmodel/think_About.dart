import 'package:flutter/material.dart';

import '../model/think_About.dart';
import '../repo/think_About.dart';

class ThinkAboutNotifierLoading extends ChangeNotifier {
  final ThinkAboutRepositoryLoading repository;

  ThinkAboutModelLoading? _thinkAbout;
  bool _isLoading = false;
  String? _errorMessage;

  ThinkAboutModelLoading? get thinkAbout => _thinkAbout;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  ThinkAboutNotifierLoading({required this.repository});

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
