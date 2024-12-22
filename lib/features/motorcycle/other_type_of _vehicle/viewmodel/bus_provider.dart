import 'package:flutter/material.dart';

import '../model/bus_model.dart';
import '../repo/bus_repo.dart';

class BusAndTramInfoProvider with ChangeNotifier {
  final BusAndTramInfoRepository _repository;

  BusAndTramInfo? _data;
  bool _isLoading = false;
  String? _errorMessage;

  BusAndTramInfoProvider(this._repository);

  BusAndTramInfo? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Fetch data from the repository
  Future<void> fetchBusAndTramInfo(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchBusAndTramInfo(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
