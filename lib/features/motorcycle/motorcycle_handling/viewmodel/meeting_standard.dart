import 'package:flutter/material.dart';

import '../model/meeting_standard.dart';
import '../repo/meeting_standard_repo.dart';

class MeetingStandardsInfoNotifier extends ChangeNotifier {
  MeetingStandardsInfoHandling? _info;
  bool _isLoading = false;

  MeetingStandardsInfoHandling? get info => _info;
  bool get isLoading => _isLoading;

  final MeetingStandardsInfoRepositoryHandling _repository = MeetingStandardsInfoRepositoryHandling();

  Future<void> loadMeetingStandardsInfo(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _info = await _repository.fetchMeetingStandardsInfo(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
