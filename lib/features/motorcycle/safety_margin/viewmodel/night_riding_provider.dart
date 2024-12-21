import 'package:flutter/material.dart';

import '../model/at_night_model.dart';
import '../repo/night_riding_repo.dart';

class NightRidingNotifier extends ChangeNotifier {
  NightRiding? _data;

  NightRiding? get data => _data;

  Future<void> fetchNightRidingData() async {
    try {
      NightRidingRepository repository = NightRidingRepository();
      _data = await repository.getNightRidingData();
      notifyListeners();
    } catch (e) {
      print("Error fetching Night Riding data: $e");
    }
  }
}
