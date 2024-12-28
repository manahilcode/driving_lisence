import 'package:flutter/material.dart';

import '../model/meeting_with_Standard.dart';
import '../repo/meeting_standard_repo.dart';

class MeetingStandardsProviderVulnerable with ChangeNotifier {
  final MeetingStandardsRepositoryVulnurable _repository;
  MeetingStandardsVulnurable? _data;
  bool _isLoading = false;
  String? _errorMessage;

  MeetingStandardsVulnurable? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  MeetingStandardsProviderVulnerable(this._repository);

  // Fetch data from the repository
  Future<void> fetchMeetingStandardsData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchMeetingStandardsData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
