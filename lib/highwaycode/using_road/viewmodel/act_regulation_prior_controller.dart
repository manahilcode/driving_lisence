import 'package:flutter/foundation.dart';

import '../model/act_regulation_prior_model.dart';
import '../repo/act_regulation_prior_repo.dart';

class ActsAndRegulationsPriorTo1988Provider with ChangeNotifier {
  final ActsAndRegulationsPriorTo1988Repo _repo = ActsAndRegulationsPriorTo1988Repo();
  ActsAndRegulationsPriorTo1988? _data;
  bool _isLoading = false;
  String _errorMessage = '';

  ActsAndRegulationsPriorTo1988? get data => _data;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchActsAndRegulationsData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repo.getActsAndRegulationsData();
      _errorMessage = '';
    } catch (e) {
      _data = null;
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
