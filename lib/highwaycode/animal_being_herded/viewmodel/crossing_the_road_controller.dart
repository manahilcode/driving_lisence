// Provider Class
import 'package:flutter/cupertino.dart';

import '../model/crossing_the_road_model.dart';
import '../model/road_junction_model.dart';
import '../repo/crossing_the_road_repo.dart';

class PointsProvider extends ChangeNotifier {
  final CrossingTheRoadRepo _repository;
  CrossingTheRoadModel? _point;
  bool _isLoading = false;
  String? _error;

  PointsProvider(this._repository);

  CrossingTheRoadModel? get point => _point;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPoint(String documentId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _point = await _repository.getPoint(documentId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}