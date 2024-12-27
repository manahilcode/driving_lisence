import 'package:flutter/material.dart';

import '../model/things_discuss.dart';
import '../repo/things_discuss.dart';

class ThingDiscussProviderDocument with ChangeNotifier {
  final DriverInfoRepositoryDocument _repository = DriverInfoRepositoryDocument();

  ThingsDiscussDocument? _driverInfo;
  ThingsDiscussDocument? get driverInfo => _driverInfo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchDriverInfo() async {
    _isLoading = true;
    notifyListeners();

    try {
      _driverInfo = await _repository.fetchDriverInfo();
    } catch (e) {
      // Handle error (could show a message)
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
