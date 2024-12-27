import 'package:flutter/material.dart';

import '../model/meeting_Standard_model.dart';
import '../repo/meeting_standard_repo.dart';

class StandardsProviderAttitude extends ChangeNotifier {
  final StandardsRepository _repository = StandardsRepository();

  StandardsModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  StandardsModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchStandardsData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchStandardsData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
