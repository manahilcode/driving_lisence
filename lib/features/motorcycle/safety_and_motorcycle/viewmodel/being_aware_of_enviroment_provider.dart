import 'package:flutter/material.dart';
import '../model/being_aware_of_enviroment_model.dart';
import '../repo/being_aware_of_enviroment_repo.dart';

class BeingAwareOfTheEnvironmentProvider extends ChangeNotifier {
  final BeingAwareOfTheEnvironmentRepository _repository = BeingAwareOfTheEnvironmentRepository();

  BeingAwareOfTheEnvironmentModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  BeingAwareOfTheEnvironmentModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
