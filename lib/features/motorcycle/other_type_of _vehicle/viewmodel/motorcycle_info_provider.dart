import 'package:flutter/material.dart';

import '../model/motorcycle_info.dart';
import '../repo/motorcycle_info_repo.dart';

class MotorcycleInfoNotifier extends ChangeNotifier {
  MotorcycleInfo1? _info;
  bool _isLoading = false;

  MotorcycleInfo1? get info => _info;
  bool get isLoading => _isLoading;

  final MotorcycleInfoRepository1 _repository = MotorcycleInfoRepository1();

  Future<void> loadMotorcycleInfo(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _info = await _repository.fetchMotorcycleInfo(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
