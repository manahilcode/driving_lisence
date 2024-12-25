import 'package:flutter/material.dart';
import '../model/anticipation_model.dart';
import '../repo/anticipation_repo.dart';

class AnticipationProvider extends ChangeNotifier {
  final RoadAwarenessRepository _repository;
  AnticipationModel? _data;
  bool _isLoading = false;
  String? _error;

  AnticipationProvider(this._repository);

  AnticipationModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchRoadAwarenessData(String collection, String document) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _data = await _repository.fetchRoadAwarenessData(collection, document);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
