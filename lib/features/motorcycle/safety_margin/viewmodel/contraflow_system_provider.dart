import 'package:flutter/material.dart';

import '../model/contraflow_system.dart';
import '../repo/contraflow_system_repo.dart';

class ContraflowSystemNotifier extends ChangeNotifier {
  ContraflowSystem? _data;

  ContraflowSystem? get data => _data;

  Future<void> fetchContraflowSystemData() async {
    try {
      ContraflowSystemRepository repository = ContraflowSystemRepository();
      _data = await repository.getContraflowSystemData();
      notifyListeners();
    } catch (e) {
      print("Error fetching Contraflow System data: $e");
    }
  }
}
