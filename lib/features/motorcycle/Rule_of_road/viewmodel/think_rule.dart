import 'package:flutter/material.dart';

import '../model/think_about.dart';
import '../repo/think_about_repo.dart';

class ThinkRule extends ChangeNotifier {
  final ThinkAboutRepoRule _repository;
  ThinkAboutRule? _data;
  bool _isLoading = false;

  ThinkAboutRule? get data => _data;
  bool get isLoading => _isLoading;

  ThinkRule(this._repository);

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchSpeedLimitData();
    } catch (e) {
      // Handle error here
    }

    _isLoading = false;
    notifyListeners();
  }
}
