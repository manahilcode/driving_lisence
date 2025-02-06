import 'package:flutter/material.dart';

import '../model/history_sign_model.dart';
import '../repo/history_repo.dart';

class TrafficSignProvider123 extends ChangeNotifier {
  final TrafficSignRepository122 _repository = TrafficSignRepository122();
  TrafficSignHistory? _trafficSignHistory;
  bool _isLoading = false;

  TrafficSignHistory? get trafficSignHistory => _trafficSignHistory;
  bool get isLoading => _isLoading;

  Future<void> fetchTrafficSignHistory() async {
    _isLoading = true;
    notifyListeners();

    try {
      _trafficSignHistory = await _repository.fetchTrafficSignHistory();
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}