import 'package:flutter/material.dart';

import '../model/model.dart';

import 'package:flutter/foundation.dart';
import '../model/model.dart';
import '../repo/repo.dart'; // Import your models

class RoadSignController extends ChangeNotifier {
  final RepositoryRoadSign _repository = RepositoryRoadSign(); // Initialize repository

  // Introduction Road Sign
  IntroductionRoadsign? _introductionRoadsign;
  IntroductionRoadsign? get introductionRoadsign => _introductionRoadsign;

  // Sign Road Sign
  SignRoadSign? _signRoadSign;
  SignRoadSign? get signRoadSign => _signRoadSign;

  // Discuss Instructor Road Sign
  DiscussInstructorRoadSign? _discussInstructorRoadSign;
  DiscussInstructorRoadSign? get discussInstructorRoadSign => _discussInstructorRoadSign;

  // Meeting Standard Road Sign
  MeetingStandardRoadSign? _meetingStandardRoadSign;
  MeetingStandardRoadSign? get meetingStandardRoadSign => _meetingStandardRoadSign;

  // Road Lane Road Sign
  RoadLaneRoadSign? _roadLaneRoadSign;
  RoadLaneRoadSign? get roadLaneRoadSign => _roadLaneRoadSign;

  // Road Marking Road Sign
  RoadMarkingRoadSign? _roadMarkingRoadSign;
  RoadMarkingRoadSign? get roadMarkingRoadSign => _roadMarkingRoadSign;

  // Driver Signal
  DriverSignal? _driverSignal;
  DriverSignal? get driverSignal => _driverSignal;

  // Think About Road Sign
  ThinkAboutRoadSign? _thinkAboutRoadSign;
  ThinkAboutRoadSign? get thinkAboutRoadSign => _thinkAboutRoadSign;

  // Traffic Light And Warning
  TrafficLightAndWarning? _trafficLightAndWarning;
  TrafficLightAndWarning? get trafficLightAndWarning => _trafficLightAndWarning;

  // Fetch and update data from repository
  Future<void> fetchIntroductionRoadSign(String documentId) async {
    _introductionRoadsign = await _repository.getIntroductionRoadsign(documentId);
    notifyListeners();
  }

  Future<void> fetchSignRoadSign(String documentId) async {
    _signRoadSign = await _repository.getSignRoadSign(documentId);
    notifyListeners();
  }

  Future<void> fetchDiscussInstructorRoadSign(String documentId) async {
    _discussInstructorRoadSign = await _repository.getDiscussInstructorRoadSign(documentId);
    notifyListeners();
  }

  Future<void> fetchMeetingStandardRoadSign(String documentId) async {
    _meetingStandardRoadSign = await _repository.getMeetingStandardRoadSign(documentId);
    notifyListeners();
  }

  Future<void> fetchRoadLaneRoadSign(String documentId) async {
    _roadLaneRoadSign = await _repository.getRoadLaneRoadSign(documentId);
    notifyListeners();
  }

  Future<void> fetchRoadMarkingRoadSign(String documentId) async {
    _roadMarkingRoadSign = await _repository.getRoadMarkingRoadSign(documentId);
    notifyListeners();
  }

  Future<void> fetchDriverSignal(String documentId) async {
    _driverSignal = await _repository.getDriverSignal(documentId);
    notifyListeners();
  }

  Future<void> fetchThinkAboutRoadSign(String documentId) async {
    _thinkAboutRoadSign = await _repository.fetchThinkAboutRoadSign(documentId);
    notifyListeners();
  }

  Future<void> fetchTrafficLightAndWarning(String documentId) async {
    _trafficLightAndWarning = await _repository.fetchTrafficLightAndWarning(documentId);
    notifyListeners();
  }

  // Clear all data
  void clearAll() {
    _introductionRoadsign = null;
    _signRoadSign = null;
    _discussInstructorRoadSign = null;
    _meetingStandardRoadSign = null;
    _roadLaneRoadSign = null;
    _roadMarkingRoadSign = null;
    _driverSignal = null;
    _thinkAboutRoadSign = null;
    _trafficLightAndWarning = null;
    notifyListeners();
  }
}

