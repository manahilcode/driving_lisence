import 'package:flutter/material.dart';

import '../model/knowing_and_applying_rules_model.dart';
import '../repo/knowing_and_applying_rules_repo.dart';

class KnowingAndApplyingRulesController extends ChangeNotifier {
  final RuleRepository _repository = RuleRepository();
  RuleModel? _rule;
  bool _isLoading = false;
  String _errorMessage = '';

  RuleModel? get rule => _rule;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> loadRule(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    final data = await _repository.fetchRuleData(collection, document);

    if (data != null) {
      _rule = data;
      _errorMessage = '';
    } else {
      _rule = null;
      _errorMessage = 'Failed to load data.';
    }

    _isLoading = false;
    notifyListeners();
  }
}
