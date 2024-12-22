import 'package:flutter/material.dart';
import '../model/fog_info_model.dart';
import '../repo/fog_repo.dart';
import 'fog_info.dart';

class FogInfoNotifier extends ChangeNotifier {
  FogInfo? _info;
  bool _isLoading = false;

  FogInfo? get info => _info;
  bool get isLoading => _isLoading;

  final FogInfoRepository _repository = FogInfoRepository();

  Future<void> loadFogInfo(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _info = await _repository.fetchFogInfo(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
