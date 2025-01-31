import 'package:flutter/material.dart';

import '../model/overhead_electric_line_model.dart';
import '../repo/overhead_electric_line_repo.dart';

class OverheadElectricLinesProvider with ChangeNotifier {
  final OverheadElectricLinesRepository _repository = OverheadElectricLinesRepository();
  OverheadElectricLinesModel? _electricLinesData;
  bool _isLoading = false;
  String _errorMessage = '';

  OverheadElectricLinesModel? get electricLinesData => _electricLinesData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchOverheadElectricLinesData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _electricLinesData = await _repository.fetchOverheadElectricLinesData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
