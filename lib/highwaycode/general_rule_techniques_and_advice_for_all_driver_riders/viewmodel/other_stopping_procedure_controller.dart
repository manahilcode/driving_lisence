import 'package:flutter/material.dart';

import '../model/other_stopping_procedure_model.dart';
import '../repo/other_stopping_procedure_repo.dart';

class OtherStoppingProceduresProvider extends ChangeNotifier {
  final OtherStoppingProceduresRepository _repository = OtherStoppingProceduresRepository();

  OtherStoppingProcedures? _otherStoppingProceduresData;
  OtherStoppingProcedures? get otherStoppingProceduresData => _otherStoppingProceduresData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  // Fetch data from repository and notify listeners
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _otherStoppingProceduresData = await _repository.fetchOtherStoppingProceduresData();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
