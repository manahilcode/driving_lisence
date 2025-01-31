import 'package:flutter/foundation.dart';

import '../model/on_the_road_model.dart';
import '../repo/on_the_road_repo.dart';

class HighwayCode11Provider with ChangeNotifier {
  final HighwayCode11Repo _repo = HighwayCode11Repo();
  HighwayCode11? _highwayCode11Data;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayCode11? get highwayCode11Data => _highwayCode11Data;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayCode11Data() async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayCode11Data = await _repo.getHighwayCode11Data();
      _errorMessage = '';
    } catch (e) {
      _highwayCode11Data = null;
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
