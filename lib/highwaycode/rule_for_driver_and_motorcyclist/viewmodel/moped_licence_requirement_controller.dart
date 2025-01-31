import 'package:flutter/material.dart';

import '../model/moped_licence_requirement_model.dart';
import '../repo/moped_licence_requirement_repo.dart';

class MopedLicenceRequirementsProvider with ChangeNotifier {
  final MopedLicenceRequirementsRepository _repository = MopedLicenceRequirementsRepository();

  MopedLicenceRequirementsModel? _mopedLicenceData;
  bool _isLoading = false;
  String _errorMessage = '';

  MopedLicenceRequirementsModel? get mopedLicenceData => _mopedLicenceData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchMopedLicenceRequirements() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _mopedLicenceData = await _repository.fetchMopedLicenceRequirements();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
