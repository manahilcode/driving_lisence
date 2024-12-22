import 'package:flutter/material.dart';
import '../model/lane_marking.dart';
import '../repo/lane_marking_repo.dart';
import 'lane_marking.dart';

class LaneMarkingNotifier extends ChangeNotifier {
  LaneMarkingRiding? _laneMarking;
  bool _isLoading = false;
  String _error = '';

  LaneMarkingRiding? get laneMarking => _laneMarking;
  bool get isLoading => _isLoading;
  String get error => _error;

  final LaneMarkingRepository _repository;

  LaneMarkingNotifier(this._repository);

  // Fetch lane marking data
  Future<void> fetchLaneMarking() async {
    _isLoading = true;
    notifyListeners();

    try {
      _laneMarking = await _repository.getLaneMarking();
    } catch (e) {
      _error = 'Failed to load data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
