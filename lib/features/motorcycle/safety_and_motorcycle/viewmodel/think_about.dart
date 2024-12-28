import 'package:flutter/material.dart';

import '../../allertness/repo/think_repo.dart';
import '../model/think_about.dart';
import '../repo/think_About_repo.dart';

class ThinkAboutNotifierSafety extends ChangeNotifier {
  MotorcycleThinkAbout? _data;

  MotorcycleThinkAbout? get data => _data;

  Future<void> fetchData() async {
    try {
      MotorcycleSafetyThinkAboutRepository repository = MotorcycleSafetyThinkAboutRepository();
      _data = await repository.MotorcycleGetThinkAboutData();
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
