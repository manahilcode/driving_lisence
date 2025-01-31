import 'package:flutter/material.dart';

import '../model/additional_rule_high_speed_road_model.dart';
import '../repo/additional_rule_high_speed_road_repo.dart';

class AdditionalRulesHighSpeedRoadsProvider with ChangeNotifier {
  final AdditionalRulesHighSpeedRoadsRepository _repository = AdditionalRulesHighSpeedRoadsRepository();
  AdditionalRulesHighSpeedRoadsModel? _rulesData;
  bool _isLoading = false;
  String _errorMessage = '';

  AdditionalRulesHighSpeedRoadsModel? get rulesData => _rulesData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighSpeedRoadRules() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _rulesData = await _repository.fetchHighSpeedRoadRules();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
