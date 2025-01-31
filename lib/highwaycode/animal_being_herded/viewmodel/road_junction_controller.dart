// Provider Class
import 'package:flutter/cupertino.dart';

import '../model/road_junction_model.dart';
import '../repo/road_junction_repo.dart';

class PointsProvider11 extends ChangeNotifier {
  final RoadJunctionRepository _repository;
  RoadJunctionModel? _pointsModel;
  bool _isLoading = false;
  String? _error;

  PointsProvider11(this._repository);

  RoadJunctionModel? get pointsModel => _pointsModel;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadPoints(String documentId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _pointsModel = await _repository.fetchPoints(documentId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
