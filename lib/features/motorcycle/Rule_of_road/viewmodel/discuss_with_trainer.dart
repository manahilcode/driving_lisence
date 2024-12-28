import 'package:flutter/material.dart';

import '../model/discuss_with_trainer.dart';
import '../repo/discuss_with_trainer.dart';

class SpeedLimitNotifierRule extends ChangeNotifier {
  final DiscussWithTrainerRuleRepo _repository;
  DiscussWithTrainerRule? _data;
  bool _isLoading = false;

  DiscussWithTrainerRule? get data => _data;
  bool get isLoading => _isLoading;

  SpeedLimitNotifierRule(this._repository);

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
