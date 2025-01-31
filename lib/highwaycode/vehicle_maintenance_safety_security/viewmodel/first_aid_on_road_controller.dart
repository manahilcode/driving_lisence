import 'package:flutter/material.dart';

import '../model/first_aid_on_road_model.dart';
import '../repo/first_aid_on_road_repo.dart';

class HighwayFirstAidOnTheRoadProvider with ChangeNotifier {
  final HighwayFirstAidOnTheRoadRepository _repository = HighwayFirstAidOnTheRoadRepository();
  HighwayFirstAidOnTheRoad? _document;
  bool _isLoading = true;
  String _error = '';

  HighwayFirstAidOnTheRoad? get document => _document;
  bool get isLoading => _isLoading;
  String get error => _error;

  HighwayFirstAidOnTheRoadProvider() {
    fetchFirstAidOnTheRoadDocument();
  }

  Future<void> fetchFirstAidOnTheRoadDocument() async {
    _isLoading = true;
    notifyListeners();

    try {
      _document = await _repository.getFirstAidOnTheRoadDocument();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load First Aid on the Road document';
      _isLoading = false;
    }

    notifyListeners();
  }
}
