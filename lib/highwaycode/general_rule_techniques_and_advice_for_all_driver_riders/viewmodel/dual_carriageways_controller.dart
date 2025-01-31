import 'package:flutter/material.dart';

import '../model/dual_carriageways_model.dart';
import '../repo/dual_carriageways_repo.dart';

class DualCarriagewaysProvider extends ChangeNotifier {
  DualCarriageways? _dualCarriagewaysData;
  bool _isLoading = true;
  String _errorMessage = '';

  DualCarriageways? get dualCarriagewaysData => _dualCarriagewaysData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchDualCarriagewaysData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _dualCarriagewaysData = await DualCarriagewaysRepository().fetchDualCarriagewaysData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
