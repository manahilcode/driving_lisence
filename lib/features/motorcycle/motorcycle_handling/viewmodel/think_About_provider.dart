import 'package:flutter/material.dart';
import '../model/think_about.dart';
import '../repo/think_about_repo.dart';


class ThinkAboutNotifier extends ChangeNotifier {
  ThinkAboutHandling? _data;
  bool _isLoading = false;

  ThinkAboutHandling? get data => _data;
  bool get isLoading => _isLoading;

  final ThinkAboutRepositoryHandling _repository = ThinkAboutRepositoryHandling();

  Future<void> loadThinkAbout(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _data = await _repository.fetchThinkAbout(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
