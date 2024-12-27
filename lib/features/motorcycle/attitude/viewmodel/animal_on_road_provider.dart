import 'package:flutter/material.dart';

import '../model/animal_on_road_model.dart';
import '../repo/animal_on_road_repo.dart';

class AnimalsOnTheRoadProviderAttitude extends ChangeNotifier {
  final AnimalsOnTheRoadRepository _repository = AnimalsOnTheRoadRepository();

  AnimalsOnTheRoadModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  AnimalsOnTheRoadModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAnimalsOnTheRoadData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchAnimalsOnTheRoadData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
