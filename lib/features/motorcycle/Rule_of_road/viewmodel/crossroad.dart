import 'package:flutter/material.dart';

import '../model/crossroad.dart';
import '../repo/crossroad.dart';

class RidingGuideProvider extends ChangeNotifier {
  CrossroadRule? _ridingGuideData;
  final RidingGuideRepository _repository = RidingGuideRepository();

  CrossroadRule? get ridingGuideData => _ridingGuideData;

  Future<void> fetchRidingGuideData() async {
    try {
      _ridingGuideData = await _repository.getRidingGuideData();
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
