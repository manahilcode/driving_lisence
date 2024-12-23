import 'package:flutter/material.dart';

import '../model/sign.dart';
import '../repo/sign.dart';

class SignSignProvider with ChangeNotifier {
  SignSign? _signSign;
  bool _isLoading = false;
  String? _errorMessage;

  SignSign? get signSign => _signSign;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final SignSignRepository _repository = SignSignRepository();

  Future<void> loadSignSignData(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _signSign = await _repository.fetchSignSignData(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}