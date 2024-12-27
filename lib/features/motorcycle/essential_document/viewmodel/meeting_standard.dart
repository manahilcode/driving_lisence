import 'package:flutter/material.dart';
import '../model/meeting_the_standard.dart';
import '../repo/meeting_standard.dart';

class MeetingStandardDocument with ChangeNotifier {
  final DrivingInfoRepositoryEss _repository = DrivingInfoRepositoryEss();

  MeetingTheStandardDocument? _drivingInfo;
  MeetingTheStandardDocument? get drivingInfo => _drivingInfo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchDrivingInfo() async {
    _isLoading = true;
    notifyListeners();

    try {
      _drivingInfo = await _repository.fetchDrivingInfo();
    } catch (e) {
      // Handle the error (could show a message)
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
