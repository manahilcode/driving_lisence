import 'package:flutter/material.dart';

import '../model/new_driver_model.dart';
import '../repo/new_driver_repo.dart';

class HighwayNewDriversProvider with ChangeNotifier {
  final HighwayNewDriversRepository _repository = HighwayNewDriversRepository();
  HighwayNewDriversModel? _highwayNewDriversData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayNewDriversModel? get highwayNewDriversData => _highwayNewDriversData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayNewDriversData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayNewDriversData = await _repository.fetchHighwayNewDriversData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
