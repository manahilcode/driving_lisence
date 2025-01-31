import 'package:flutter/material.dart';

import '../model/overview_model.dart';
import '../repo/overview_repo.dart';

class HighwayOverviewProvider extends ChangeNotifier {
  final HighwayOverviewRepository _repository = HighwayOverviewRepository();

  HighwayOverview? _highwayOverviewData;
  HighwayOverview? get highwayOverviewData => _highwayOverviewData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayOverviewData = await _repository.fetchHighwayOverviewData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
