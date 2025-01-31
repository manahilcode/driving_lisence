import 'package:flutter/material.dart';

import '../model/panalty_points_disqualification_model.dart';
import '../repo/panalty_points_disqualification_repo.dart';

class PenaltyPointsAndDisqualificationProvider with ChangeNotifier {
  final PenaltyPointsAndDisqualificationRepository _repository = PenaltyPointsAndDisqualificationRepository();
  PenaltyPointsAndDisqualificationModel? _penaltyPointsData;
  bool _isLoading = false;
  String _errorMessage = '';

  PenaltyPointsAndDisqualificationModel? get penaltyPointsData => _penaltyPointsData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchPenaltyPointsData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _penaltyPointsData = await _repository.fetchPenaltyPointsData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
