import 'package:flutter/material.dart';

import '../model/seat_belts_and_child_restraints_model.dart';
import '../repo/seat_belts_and_child_restraints_repo.dart';

class SeatBeltsAndChildRestraintsProvider with ChangeNotifier {
  final SeatBeltsAndChildRestraintsRepository _repository = SeatBeltsAndChildRestraintsRepository();

  SeatBeltsAndChildRestraintsModel? _seatBeltsData;
  bool _isLoading = false;
  String _errorMessage = '';

  SeatBeltsAndChildRestraintsModel? get seatBeltsData => _seatBeltsData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchSeatBeltsAndChildRestraints() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _seatBeltsData = await _repository.fetchSeatBeltsAndChildRestraints();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
