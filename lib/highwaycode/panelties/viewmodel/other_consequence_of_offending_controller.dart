import 'package:flutter/material.dart';

import '../model/other_consequence_of_offending_model.dart';
import '../repo/other_consequence_of_offending_repo.dart';

class OtherConsequencesOfOffendingProvider with ChangeNotifier {
  final OtherConsequencesOfOffendingRepository _repository = OtherConsequencesOfOffendingRepository();
  OtherConsequencesOfOffendingModel? _otherConsequencesData;
  bool _isLoading = false;
  String _errorMessage = '';

  OtherConsequencesOfOffendingModel? get otherConsequencesData => _otherConsequencesData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchConsequencesData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _otherConsequencesData = await _repository.fetchConsequencesData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
