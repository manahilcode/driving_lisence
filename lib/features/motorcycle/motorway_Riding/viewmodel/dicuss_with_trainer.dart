import 'package:flutter/material.dart';

import '../model/dicuss_with_trainer.dart';
import '../repo/discuss_with_trainer.dart';

class TrainerPracticeProviderRiding extends ChangeNotifier {
  TrainerPracticeModelRiding? _trainerPracticeData;
  final TrainerPracticeRepositoryRiding _repository = TrainerPracticeRepositoryRiding();

  TrainerPracticeModelRiding? get trainerPracticeData => _trainerPracticeData;

  // Fetch trainer practice data
  Future<void> fetchTrainerPracticeData() async {
    try {
      _trainerPracticeData = await _repository.getTrainerPracticeData();
      notifyListeners(); // Notify listeners that the data has changed
    } catch (e) {
      print("Error fetching trainer practice data: $e");
    }
  }
}
