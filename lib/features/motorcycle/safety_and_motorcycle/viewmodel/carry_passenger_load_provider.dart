import 'package:flutter/material.dart';
import '../model/carry_passenger_load_model.dart';
import '../repo/carry_passenger_load_repo.dart';

class CarryingPassengersAndLoadsProvider extends ChangeNotifier {
  final CarryingPassengersAndLoadsRepository _repository = CarryingPassengersAndLoadsRepository();

  CarryingPassengersAndLoadsModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  CarryingPassengersAndLoadsModel? get data => _data;
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
