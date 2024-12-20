import 'package:flutter/material.dart';

import '../model/being_seen_by_other_model.dart';
import '../repo/being_seen_by_other_repo.dart';

class BeingSeenProvider extends ChangeNotifier {
  final BeingSeenRepository _repository = BeingSeenRepository();

  BeingSeenModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  BeingSeenModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchBeingSeenData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchBeingSeenData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
