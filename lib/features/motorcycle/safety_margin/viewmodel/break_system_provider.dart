import 'package:flutter/material.dart';

import '../model/break_system_model.dart';
import '../repo/break_system_repo.dart';

class AntiLockBrakingSystemNotifier extends ChangeNotifier {
  AntiLockBrakingSystem? _data;

  AntiLockBrakingSystem? get data => _data;

  Future<void> fetchAntiLockBrakingSystemData() async {
    try {
      AntiLockBrakingSystemRepository repository = AntiLockBrakingSystemRepository();
      _data = await repository.getAntiLockBrakingSystemData();
      notifyListeners();
    } catch (e) {
      print("Error fetching Anti-lock Braking System data: $e");
    }
  }
}
