import 'package:flutter/material.dart';

import '../model/overview_model.dart';
import '../repo/overview_repo.dart';

class HighwayCodeOverviewProvider with ChangeNotifier {
  final HighwayCodeOverviewRepository _repository = HighwayCodeOverviewRepository();
  HighwayCodeOverviewModel? _highwayCodeOverviewData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayCodeOverviewModel? get highwayCodeOverviewData => _highwayCodeOverviewData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayCodeOverviewData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayCodeOverviewData = await _repository.fetchHighwayCodeOverviewData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

