import 'package:flutter/material.dart';

import '../model/meeting_standard.dart';
import '../repo/meeting_standar_repo.dart';

class MeetingStandardsNotifierType extends ChangeNotifier {
  MeetingStandardsInfoOtherVehicle? _info;
  bool _isLoading = false;

  MeetingStandardsInfoOtherVehicle? get info => _info;
  bool get isLoading => _isLoading;

  final MeetingStandardsRepositoryOtherVehicle1 _repository = MeetingStandardsRepositoryOtherVehicle1();

  Future<void> loadMeetingStandardsInfo(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _info = await _repository.fetchMeetingStandardsInfo(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
