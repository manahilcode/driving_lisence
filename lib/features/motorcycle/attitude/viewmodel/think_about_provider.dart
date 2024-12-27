import 'package:flutter/material.dart';

import '../../allertness/model/think_about.dart';
import '../../allertness/repo/think_repo.dart';
import '../repo/think_about_repo.dart';

class ThinkAboutProviderAttitude extends ChangeNotifier {
  final AttitudeThinkAboutRepository _repository = AttitudeThinkAboutRepository();

  ThinkAboutModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  ThinkAboutModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchThinkAboutInfo(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.AttitudefetchThinkAboutInfo(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
