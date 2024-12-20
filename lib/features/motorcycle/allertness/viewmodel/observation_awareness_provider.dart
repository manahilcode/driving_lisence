import 'package:flutter/material.dart';

import '../model/observation_awarness_model.dart';
import '../repo/observation_awareness_repo.dart';

class ObservationAwarenessNotifier extends ChangeNotifier {
  final ObservationAwarenessRepository _repository;

  ObservationAwarenessData? _data;
  bool _isLoading = false;
  String? _error;

  ObservationAwarenessNotifier(this._repository);

  ObservationAwarenessData? get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchData(String collection, String document) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _data = await _repository.fetchObservationAwarenessData(collection, document);
      _isLoading = false;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
    }

    notifyListeners();
  }
}
