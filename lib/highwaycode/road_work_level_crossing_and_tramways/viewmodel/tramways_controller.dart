import 'package:flutter/material.dart';

import '../model/tramways_model.dart';
import '../repo/tramways_repo.dart';

class HighwaycodeTramwaysProvider with ChangeNotifier {
  final HighwaycodeTramwaysRepository _repository = HighwaycodeTramwaysRepository();
  HighwaycodeTramwaysModel? _tramwaysData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwaycodeTramwaysModel? get tramwaysData => _tramwaysData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwaycodeTramwaysData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _tramwaysData = await _repository.fetchHighwaycodeTramwaysData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
