import 'package:flutter/material.dart';

import '../model/older_and_disabled.dart';
import '../repo/older_disable_repo.dart';

class OlderAndDisabledPedestriansProvider with ChangeNotifier {
  final OlderAndDisabledPedestriansRepository _repository;
  OlderAndDisabledPedestrians? _data;
  bool _isLoading = false;
  String? _errorMessage;

  OlderAndDisabledPedestrians? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  OlderAndDisabledPedestriansProvider(this._repository);

  // Fetch data from the repository
  Future<void> fetchOlderAndDisabledPedestriansData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchOlderAndDisabledPedestriansData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
