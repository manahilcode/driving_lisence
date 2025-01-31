import 'package:flutter/material.dart';

import '../model/moped_licence_requirement_model.dart';
import '../repo/moped_licence_requirement_repo.dart';

class MopedLicenceRequirements11Provider extends ChangeNotifier {
  MopedLicenceRequirements11? _mopedLicenceRequirements11;
  bool _isLoading = false;
  String _errorMessage = '';

  MopedLicenceRequirements11? get mopedLicenceRequirements11 => _mopedLicenceRequirements11;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  final MopedLicenceRequirements11Repository _repository =
  MopedLicenceRequirements11Repository();

  // Method to fetch moped licence requirements
  Future<void> fetchMopedLicenceRequirements11() async {
    _isLoading = true;
    notifyListeners();

    try {
      _mopedLicenceRequirements11 = await _repository.fetchMopedLicenceRequirements11();
      if (_mopedLicenceRequirements11 == null) {
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
