import 'package:flutter/material.dart';

import '../model/break_down.dart';
import '../repo/break_down.dart';

class BreakdownProvider with ChangeNotifier {
  final BreakdownRepository _repository = BreakdownRepository();
  BreakdownModel? _data;
  bool _isLoading = false;

  BreakdownModel? get data => _data;
  bool get isLoading => _isLoading;

  Future<void> fetchBreakdown(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchBreakdownData(documentId);
    } catch (e) {
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
