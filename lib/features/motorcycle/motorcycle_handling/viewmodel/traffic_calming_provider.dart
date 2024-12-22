import 'package:flutter/material.dart';

import '../model/traffic_calming.dart';
import '../repo/traffic_calming_repo.dart';

class TrafficCalmingNotifier extends ChangeNotifier {
  TrafficCalmingHandling? _data;
  bool _isLoading = false;

  TrafficCalmingHandling? get data => _data;
  bool get isLoading => _isLoading;

  final TrafficCalmingRepository _repository = TrafficCalmingRepository();

  Future<void> loadTrafficCalming(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _data = await _repository.fetchTrafficCalming(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
