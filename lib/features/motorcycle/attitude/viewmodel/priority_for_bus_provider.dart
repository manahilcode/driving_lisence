import 'package:flutter/material.dart';

import '../model/periority_for_Bus.dart';
import '../repo/priority_for_bus_repo.dart';

class CrossingInfoProvider extends ChangeNotifier {
  final CrossingInfoRepository _repository = CrossingInfoRepository();

  CrossingInfoModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  CrossingInfoModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCrossingInfo(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchCrossingInfo(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
