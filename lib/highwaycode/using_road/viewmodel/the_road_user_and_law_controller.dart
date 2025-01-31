import 'package:flutter/foundation.dart';

import '../model/the_road_user_and_law_model.dart';
import '../repo/the_road_user_and_law_repo.dart';

class RoadUserAndTheLawProvider with ChangeNotifier {
  final RoadUserAndTheLawRepo _repo = RoadUserAndTheLawRepo();
  RoadUserAndTheLaw? _data;
  bool _isLoading = false;
  String _errorMessage = '';

  RoadUserAndTheLaw? get data => _data;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchRoadUserAndTheLawData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repo.getRoadUserAndTheLawData();
      _errorMessage = '';
    } catch (e) {
      _data = null;
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
