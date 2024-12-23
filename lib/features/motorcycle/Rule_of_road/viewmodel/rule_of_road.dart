// ChangeNotifier Class
import 'package:flutter/material.dart';

import '../model/rule_of_road.dart';
import '../repo/rule_of_road.dart';

class RulesOfTheRoadNotifier extends ChangeNotifier {
  final RulesOfTheRoadRepository _repository;

  RulesOfTheRoadNotifier(this._repository);

  RulesOfTheRoadModel? _rulesOfTheRoad;
  RulesOfTheRoadModel? get rulesOfTheRoad => _rulesOfTheRoad;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadRulesOfTheRoad(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _rulesOfTheRoad = await _repository.fetchRulesOfTheRoadData(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}