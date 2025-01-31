import 'package:flutter/material.dart';
import '../model/about_theory_model.dart';
import '../repo/about_theory_repo.dart';

class GettingInfoProvider with ChangeNotifier {
  final GettingInfoRepository _repository;
  GettingInfo? _gettingInfo;
  bool _isLoading = false;
  String? _errorMessage;

  GettingInfoProvider(this._repository) ;

  GettingInfo? get gettingInfo => _gettingInfo;
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
