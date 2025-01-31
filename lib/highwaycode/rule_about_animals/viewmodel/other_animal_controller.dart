import 'package:flutter/material.dart';

import '../model/other_animal_model.dart';
import '../repo/other_animal_repo.dart';

class HighwayCodeOtherAnimalsProvider with ChangeNotifier {
  final HighwayCodeOtherAnimalsRepository _repository = HighwayCodeOtherAnimalsRepository();
  HighwayCodeOtherAnimalsModel? _highwayCodeOtherAnimalsData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayCodeOtherAnimalsModel? get highwayCodeOtherAnimalsData => _highwayCodeOtherAnimalsData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayCodeOtherAnimalsData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayCodeOtherAnimalsData = await _repository.fetchHighwayCodeOtherAnimalsData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
