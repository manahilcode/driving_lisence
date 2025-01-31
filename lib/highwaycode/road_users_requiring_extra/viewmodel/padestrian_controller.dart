import 'package:flutter/material.dart';

import '../model/padestrian_model.dart';
import '../repo/padestrian_repo.dart';

class HighwayPedestriansProvider with ChangeNotifier {
  final HighwayPedestriansRepository _repository = HighwayPedestriansRepository();
  HighwayPedestriansModel? _highwayPedestriansData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayPedestriansModel? get highwayPedestriansData => _highwayPedestriansData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayPedestriansData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayPedestriansData = await _repository.fetchHighwayPedestriansData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
