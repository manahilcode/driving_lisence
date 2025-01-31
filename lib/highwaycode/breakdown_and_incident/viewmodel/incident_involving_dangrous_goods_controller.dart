import 'package:flutter/material.dart';

import '../model/incident_involving_dangrous_goods_model.dart';
import '../repo/incident_involving_dangrous_goods_repo.dart';

class IncidentAdviceProvider extends ChangeNotifier {
  IncidentInvolvingDangrousGoodsModel? _incidentAdvice;
  bool _isLoading = true;
  String _errorMessage = '';

  // Getters
  IncidentInvolvingDangrousGoodsModel? get incidentAdvice => _incidentAdvice;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Fetch data from the repository
  Future<void> fetchIncidentAdvice() async {
    _isLoading = true;
    notifyListeners();  // Notify listeners about loading state change

    try {
      _incidentAdvice = await IncidentInvolvingDangrousGoodsRepo().fetchIncidentAdvice();
    } catch (e) {
      _errorMessage = 'Failed to fetch data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();  // Notify listeners when the loading is complete
    }
  }
}
