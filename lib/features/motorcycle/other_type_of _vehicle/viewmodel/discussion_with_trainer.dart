import 'package:driving_lisence/features/motorcycle/other_type_of%20_vehicle/model/discussion_with_trainer.dart';
import 'package:flutter/material.dart';
import '../repo/discusstion_with_trainer_Repo.dart';
import '../repo/meeting_standar_repo.dart';


class DiscussionPracticeInfoNotifier extends ChangeNotifier {
  DiscussionPracticeInfoOtherVehicle? _info;
  bool _isLoading = false;

  DiscussionPracticeInfoOtherVehicle? get info => _info;
  bool get isLoading => _isLoading;

  final DiscussionPracticeInfoRepository1 _repository = DiscussionPracticeInfoRepository1();

  Future<void> loadDiscussionPracticeInfo(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _info = await _repository.fetchDiscussionPracticeInfo(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}

class MeetingStandardsRepositoryOtherVehicle {
}
