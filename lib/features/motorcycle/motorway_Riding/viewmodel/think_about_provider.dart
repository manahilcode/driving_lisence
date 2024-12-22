import 'package:flutter/material.dart';

import '../model/think_about_model.dart';
import '../repo/think_about_repo.dart';

class ThinkAboutProvider extends ChangeNotifier {
  ThinkAboutModelRiding? _thinkAboutData;
  final ThinkAboutRepositoryRiding _repository = ThinkAboutRepositoryRiding();

  ThinkAboutModelRiding? get thinkAboutData => _thinkAboutData;

  // Fetch "Think About" data
  Future<void> fetchThinkAboutData() async {
    try {
      _thinkAboutData = await _repository.getThinkAboutData();
      notifyListeners(); // Notify listeners that the data has changed
    } catch (e) {
      print("Error fetching Think About data: $e");
    }
  }
}
