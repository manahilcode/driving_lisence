import 'package:flutter/material.dart';

import '../model/direction_model.dart';
import '../repo/direction_repo.dart';

class SignProvider extends ChangeNotifier {
  final SignRepository _repository = SignRepository();
  SignData? _signData;
  bool _isLoading = false;

  SignData? get signData => _signData;
  bool get isLoading => _isLoading;

  Future<void> fetchSignData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _signData = await _repository.fetchSignData();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}