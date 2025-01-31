import 'package:flutter/material.dart';

import '../model/alcohal_drugs_model.dart';
import '../repo/alcohal_drugs_repo.dart';

class HighwayCodeAlcoholDrugsProvider with ChangeNotifier {
  final HighwayCodeAlcoholDrugsRepository _repository = HighwayCodeAlcoholDrugsRepository();
  HighwayCodeAlcoholDrugsModel? _highwayCodeAlcoholDrugsData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayCodeAlcoholDrugsModel? get highwayCodeAlcoholDrugsData => _highwayCodeAlcoholDrugsData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayCodeAlcoholDrugsData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayCodeAlcoholDrugsData = await _repository.fetchHighwayCodeAlcoholDrugsData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
