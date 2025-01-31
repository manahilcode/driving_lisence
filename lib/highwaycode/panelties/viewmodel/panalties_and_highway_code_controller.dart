import 'package:flutter/material.dart';

import '../model/panalties_and_highway_code_model.dart';
import '../repo/panalties_and_highway_code_repo.dart';

class PenaltiesAndHighwayCodeProvider with ChangeNotifier {
  final PenaltiesAndHighwayCodeRepository _repository = PenaltiesAndHighwayCodeRepository();
  PenaltiesAndHighwayCodeModel? _penaltiesData;
  bool _isLoading = false;
  String _errorMessage = '';

  PenaltiesAndHighwayCodeModel? get penaltiesData => _penaltiesData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchPenaltiesData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _penaltiesData = await _repository.fetchPenaltiesData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
