import 'package:flutter/foundation.dart';

import '../model/on_pavements_model.dart';
import '../repo/on_pavements_repo.dart';

class OnPavementsProvider with ChangeNotifier {
  final OnPavementsRepo _repo = OnPavementsRepo();
  OnPavements? _onPavementsData;
  bool _isLoading = false;
  String _errorMessage = '';

  OnPavements? get onPavementsData => _onPavementsData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchOnPavementsData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _onPavementsData = await _repo.getOnPavementsData();
      _errorMessage = '';
    } catch (e) {
      _onPavementsData = null;
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
