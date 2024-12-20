import 'package:flutter/material.dart';

import '../model/good_manner_on_road_model.dart';
import '../repo/good_manner_road_repo.dart';

class GoodMannersProvider extends ChangeNotifier {
  final GoodMannersRepository _repository = GoodMannersRepository();

  GoodMannersModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  GoodMannersModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchGoodMannersData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchGoodMannersData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
