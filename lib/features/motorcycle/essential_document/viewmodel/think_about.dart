import 'package:flutter/material.dart';

import '../model/think_About.dart';
import '../repo/think_About.dart';

class TaxingMotorcycleInfoProvider with ChangeNotifier {
  final ThinkAboutRepositoryDocument _repository = ThinkAboutRepositoryDocument();

  ThinkAboutDocument? _taxingMotorcycleInfo;
  ThinkAboutDocument? get taxingMotorcycleInfo => _taxingMotorcycleInfo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchTaxingMotorcycleInfo() async {
    _isLoading = true;
    notifyListeners();

    try {
      _taxingMotorcycleInfo = await _repository.fetchTaxingMotorcycleInfo();
    } catch (e) {
      // Handle error (could show a message)
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
