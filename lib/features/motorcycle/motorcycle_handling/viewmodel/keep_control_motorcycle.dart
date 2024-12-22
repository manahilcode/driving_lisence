import 'package:flutter/material.dart';

import '../model/keep_control_motorcycle.dart';
import '../repo/keep_motorcycle_control_repo.dart';

class MotorcycleControlInfoNotifier extends ChangeNotifier {
  MotorcycleControlInfo? _info;
  bool _isLoading = false;

  MotorcycleControlInfo? get info => _info;
  bool get isLoading => _isLoading;

  final MotorcycleControlInfoRepository _repository = MotorcycleControlInfoRepository();

  Future<void> loadControlInfo(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _info = await _repository.fetchControlInfo(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
