// ChangeNotifier Class
import 'package:flutter/material.dart';

import '../model/overtaking_crossing.dart';
import '../repo/over_taking_crossing.dart';

class OvertakingCrossingsNotifier extends ChangeNotifier {
  final OvertakingCrossingsRepository repository;

  OvertakingCrossings? _data;
  bool _isLoading = false;
  String? _error;

  OvertakingCrossings? get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  OvertakingCrossingsNotifier(this.repository);

  Future<void> loadOvertakingCrossings(String documentId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _data = await repository.fetchOvertakingCrossings(documentId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}