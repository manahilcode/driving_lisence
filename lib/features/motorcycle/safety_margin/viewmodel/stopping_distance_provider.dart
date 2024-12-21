import 'package:flutter/foundation.dart';

import '../model/stopping_distance_model.dart';
import '../repo/stopping_distance_repo.dart';

class StoppingDistanceNotifier extends ChangeNotifier {
  StoppingDistanceModel? _stoppingDistanceData;
  bool _isLoading = false;
  String _errorMessage = '';

  StoppingDistanceModel? get stoppingDistanceData => _stoppingDistanceData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final StoppingDistanceRepository _repository;

  StoppingDistanceNotifier(this._repository);

  // Fetch data and notify listeners
  Future<void> fetchStoppingDistanceData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _stoppingDistanceData = await _repository.fetchStoppingDistanceData();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
