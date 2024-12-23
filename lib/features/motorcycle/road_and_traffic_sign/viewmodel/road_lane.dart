import 'package:flutter/foundation.dart';

import '../model/road_lane.dart';
import '../repo/raod_lane.dart';

class RoadLanesProvider with ChangeNotifier {
  final RoadLanesRepository repository;

  RoadLanesProvider({required this.repository});

  RoadLanesData? _roadLanesData;
  RoadLanesData? get roadLanesData => _roadLanesData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadRoadLanesData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _roadLanesData = await repository.fetchRoadLanesData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
