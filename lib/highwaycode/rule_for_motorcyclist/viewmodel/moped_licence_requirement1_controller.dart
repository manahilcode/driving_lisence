import 'package:flutter/material.dart';

import '../model/moped_licence_requirement1_model.dart';
import '../repo/moped_licence_requirement1_repo.dart';

class MopedLicenseRequirementsProvider extends ChangeNotifier {
  MopedLicenseRequirements? _mopedLicenseRequirements;
  bool _isLoading = false;
  String _errorMessage = '';

  MopedLicenseRequirements? get mopedLicenseRequirements => _mopedLicenseRequirements;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final MopedLicenseRequirementsRepository _repository =
  MopedLicenseRequirementsRepository();

  // Method to fetch moped license requirements
  Future<void> fetchMopedLicenseRequirements() async {
    _isLoading = true;
    notifyListeners();

    try {
      _mopedLicenseRequirements = await _repository.fetchMopedLicenseRequirements();
      if (_mopedLicenseRequirements == null) {
        _errorMessage = "No data found";
      }
    } catch (e) {
      _errorMessage = "Error: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
