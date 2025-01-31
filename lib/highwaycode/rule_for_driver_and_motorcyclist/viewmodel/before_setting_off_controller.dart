import 'package:flutter/material.dart';

import '../model/before_setting_off_model.dart';
import '../repo/before_setting_off_repo.dart';

class BeforeSettingOffProvider with ChangeNotifier {
  final BeforeSettingOffRepository _repository = BeforeSettingOffRepository();
  BeforeSettingOffModel? _beforeSettingOffData;
  bool _isLoading = false;
  String _errorMessage = '';

  BeforeSettingOffModel? get beforeSettingOffData => _beforeSettingOffData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchBeforeSettingOffData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _beforeSettingOffData = await _repository.fetchBeforeSettingOffData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
