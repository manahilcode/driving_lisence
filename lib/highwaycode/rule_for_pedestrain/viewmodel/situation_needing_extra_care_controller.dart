import 'package:flutter/foundation.dart';

import '../model/situation_needing_extra_care_model.dart';
import '../repo/situation_needing_extra_care_repo.dart';

class SituationsNeedingExtraCareProvider with ChangeNotifier {
  final SituationsNeedingExtraCareRepo _repo = SituationsNeedingExtraCareRepo();
  SituationsNeedingExtraCare? _situationsNeedingExtraCare;
  bool _isLoading = false;
  String _errorMessage = '';

  SituationsNeedingExtraCare? get situationsNeedingExtraCare => _situationsNeedingExtraCare;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchSituationsNeedingExtraCare() async {
    _isLoading = true;
    notifyListeners();

    try {
      _situationsNeedingExtraCare = await _repo.getSituationsNeedingExtraCare();
      _errorMessage = '';
    } catch (e) {
      _situationsNeedingExtraCare = null;
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
