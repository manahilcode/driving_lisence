import 'package:flutter/material.dart';
import '../model/riding_at_night.dart';
import '../repo/riding_At_night.dart';
import 'riding_at_night.dart';

class RidingAtNightNotifier extends ChangeNotifier {
  RidingAtNight? _data;
  bool _isLoading = false;

  RidingAtNight? get data => _data;
  bool get isLoading => _isLoading;

  final RidingAtNightRepository _repository = RidingAtNightRepository();

  Future<void> loadRidingAtNight(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _data = await _repository.fetchRidingAtNight(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
