import 'package:flutter/material.dart';

import '../model/meeting_with_standard.dart';
import '../repo/meeting_with_standard.dart';

class MeetingTheStandardsNotifier extends ChangeNotifier {
  MeetingTheStandards_Safety_Margin? _data;

  MeetingTheStandards_Safety_Margin? get data => _data;

  Future<void> fetchMeetingTheStandardsData() async {
    try {
      MeetingTheStandardsRepositorySafetyMargin repository = MeetingTheStandardsRepositorySafetyMargin();
      _data = await repository.getMeetingTheStandardsData();
      notifyListeners();
    } catch (e) {
      print("Error fetching Meeting the Standards data: $e");
    }
  }
}
