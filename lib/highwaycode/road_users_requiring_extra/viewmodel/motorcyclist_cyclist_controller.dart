import 'package:flutter/material.dart';

import '../model/motorcyclist_cyclist_model.dart';
import '../repo/motorcyclist_cyclist_repo.dart';

class MotorcyclistsAndCyclistsProvider with ChangeNotifier {
  final MotorcyclistsAndCyclistsRepository _repository = MotorcyclistsAndCyclistsRepository();
  MotorcyclistsAndCyclistsModel? _motorcyclistsAndCyclistsData;
  bool _isLoading = false;
  String _errorMessage = '';

  MotorcyclistsAndCyclistsModel? get motorcyclistsAndCyclistsData => _motorcyclistsAndCyclistsData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchMotorcyclistsAndCyclistsData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _motorcyclistsAndCyclistsData = await _repository.fetchMotorcyclistsAndCyclistsData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
