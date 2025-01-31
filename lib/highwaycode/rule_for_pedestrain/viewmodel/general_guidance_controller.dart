import 'package:flutter/foundation.dart';

import '../model/general_guidance_model.dart';
import '../repo/general_guidance_repo.dart';

class HighwayCodeProvider1245 with ChangeNotifier {
  final HighwayCodeWordOfRepo124 _repo = HighwayCodeWordOfRepo124();
  HighwayCodeGeneralGuidance11? _highwayCodeGeneralGuidance;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayCodeGeneralGuidance11? get highwayCodeGeneralGuidance => _highwayCodeGeneralGuidance;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayCodeGeneralGuidance() async {
    _isLoading = true;
    notifyListeners();

    try {
      _highwayCodeGeneralGuidance = await _repo.getHighwayCodeGeneralGuidance();
      _errorMessage = '';
    } catch (e) {
      _highwayCodeGeneralGuidance = null;
      _errorMessage = 'Failed to load data: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
