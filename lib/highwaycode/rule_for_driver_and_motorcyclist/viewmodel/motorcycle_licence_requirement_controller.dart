import 'package:flutter/material.dart';

import '../model/motorcycle_licence_requirement_model.dart';
import '../repo/motorcycle_licence_requirement_repo.dart';

class MotorcycleLicenceRequirementsProvider with ChangeNotifier {
  final MotorcycleLicenceRequirementsRepository _repository = MotorcycleLicenceRequirementsRepository();

  MotorcycleLicenceRequirementsModel? _motorcycleLicenceData;
  bool _isLoading = false;
  String _errorMessage = '';

  MotorcycleLicenceRequirementsModel? get motorcycleLicenceData => _motorcycleLicenceData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchMotorcycleLicenceRequirements() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _motorcycleLicenceData = await _repository.fetchMotorcycleLicenceRequirements();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
