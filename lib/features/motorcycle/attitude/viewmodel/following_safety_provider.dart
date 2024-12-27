import 'package:flutter/material.dart';

import '../model/following_safety_model.dart';
import '../repo/follwing_safety_repo.dart';

class FollowingSafelyProviderAttitude extends ChangeNotifier {
  final FollowingSafelyRepository _repository = FollowingSafelyRepository();

  FollowingSafelyModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  FollowingSafelyModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchFollowingSafelyData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchFollowingSafelyData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
