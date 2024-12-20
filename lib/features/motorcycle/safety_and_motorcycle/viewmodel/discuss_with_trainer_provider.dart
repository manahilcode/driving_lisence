import 'package:flutter/material.dart';

import '../../attitude/repo/discusstion_with_trainer_repo.dart';
import '../model/discuss_with_trainee_model.dart';
import '../repo/discuss_with_trainer_repo.dart';

class TrainerDiscussionNotifier extends ChangeNotifier {
  TrainerDiscussion? _data;

  TrainerDiscussion? get data => _data;

  Future<void> fetchData() async {
    try {
      MotorCycleTrainerDiscussionRepository repository = MotorCycleTrainerDiscussionRepository();
      _data = await repository.getTrainerDiscussionData();
      notifyListeners();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
