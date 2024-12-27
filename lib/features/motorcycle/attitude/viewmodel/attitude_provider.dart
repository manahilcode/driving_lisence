import 'package:flutter/material.dart';
import '../repo/attitude_repo.dart';
import '../model/attitude_model.dart';

class AttitudeProviderAttitude extends ChangeNotifier {
  final AttitudeRepository _repository = AttitudeRepository();

  AttitudeModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  AttitudeModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAttitudeData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchAttitudeData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
