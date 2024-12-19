import 'package:flutter/material.dart';

import '../model/repoding_hazard.dart';
import '../repo/responding_hazard_repo.dart';

class RespondingToHazardsProvider extends ChangeNotifier {
  final RespondingToHazardsRepository _repository = RespondingToHazardsRepository();
  RespondingToHazards? _respondingToHazards;
  bool _isLoading = false;
  String _errorMessage = '';

  RespondingToHazards? get respondingToHazards => _respondingToHazards;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Method to fetch RespondingToHazards from the repository
  Future<void> fetchRespondingToHazards(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _respondingToHazards = await _repository.fetchRespondingToHazards(documentId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch document: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}