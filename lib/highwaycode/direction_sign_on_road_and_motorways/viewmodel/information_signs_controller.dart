import 'package:flutter/material.dart';

import '../model/information_signs_model.dart';
import '../repo/information_signs_repo.dart';

class InformationSignProvider with ChangeNotifier {
  final InformationSignRepository _repository = InformationSignRepository();

  InformationSign? _informationSign;
  bool _isLoading = false;
  String _errorMessage = '';

  InformationSign? get informationSign => _informationSign;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from Firestore and notify listeners
  Future<void> fetchInformationSign(String documentId) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _informationSign = await _repository.fetchInformationSign(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
