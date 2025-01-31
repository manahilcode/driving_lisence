import 'package:flutter/material.dart';
import '../model/about_theory_model.dart';
import '../model/driver_certification.dart';
import '../model/medical_requirement.dart';
import '../repo/about_theory_repo.dart';
import '../repo/driver_certification_repo.dart';
import '../repo/medical_requirement_repo.dart';

class MedicalRequirementControllerProvider with ChangeNotifier {
  final MedicalRequirementRepository _repository;
  MedicalRequirement? _gettingInfo;
  bool _isLoading = false;
  String? _errorMessage;

  MedicalRequirementControllerProvider(this._repository);

  MedicalRequirement? get gettingInfo => _gettingInfo;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchInfo(String docId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _gettingInfo = await _repository.getInfo(docId);
    } catch (e) {
      _errorMessage = 'Failed to load data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
