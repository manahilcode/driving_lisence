import 'package:flutter/material.dart';
import '../model/dealing_with_fault_model.dart';
import '../repo/dealing_with_fault_repo.dart';

class WheelBalancingProvider extends ChangeNotifier {
  final DealingWithFaultRepo _repository = DealingWithFaultRepo();

  DealingWithFaultModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  DealingWithFaultModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchWheelBalancingInfo(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchWheelBalancingInfo(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
