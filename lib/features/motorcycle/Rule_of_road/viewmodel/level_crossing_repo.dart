import 'package:flutter/material.dart';

import '../model/level_crossig.dart';
import '../repo/level_crossing_Repo.dart';

class LevelCrossingProvider extends ChangeNotifier {
  final LevelCrossingRepository _repository = LevelCrossingRepository();
  LevelCrossingModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  LevelCrossingModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadLevelCrossingData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchLevelCrossingData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
