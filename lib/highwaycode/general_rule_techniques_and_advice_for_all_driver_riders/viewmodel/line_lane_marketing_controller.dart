import 'package:flutter/material.dart';

import '../model/line_lane_marketing_model.dart';
import '../repo/line_lane_marketing_repo.dart';

class LinesAndLaneMarkingsProvider extends ChangeNotifier {
  LinesAndLaneMarkings? _linesAndLaneMarkingsData;
  bool _isLoading = true;
  String _errorMessage = '';

  LinesAndLaneMarkings? get linesAndLaneMarkingsData => _linesAndLaneMarkingsData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchLinesAndLaneMarkingsData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _linesAndLaneMarkingsData = await LinesAndLaneMarkingsRepository().fetchLinesAndLaneMarkingsData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

