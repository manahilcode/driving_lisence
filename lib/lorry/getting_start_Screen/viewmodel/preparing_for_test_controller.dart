//OnTheRoadRepository
import 'package:flutter/material.dart';
import '../model/other_study_aid.dart';
import '../model/preparing_for_test.dart';
import '../repo/other_study_repo.dart';
import '../repo/preparing_for_test_repo.dart';

class PreparingForTestControllerProvider with ChangeNotifier {
  final PreparingForTestRepository _repository;
  PreparingForTest? _gettingInfo;
  bool _isLoading = false;
  String? _errorMessage;

  PreparingForTestControllerProvider(this._repository);

  PreparingForTest? get gettingInfo => _gettingInfo;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchInfo(String docId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _gettingInfo = await _repository.getInfo(docId);
    } catch (e) {
      _errorMessage = 'Failed to load data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
