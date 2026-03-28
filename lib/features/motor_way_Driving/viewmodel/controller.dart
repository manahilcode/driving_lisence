import 'package:flutter/material.dart';
import '../model/model.dart';
import '../repo/repo.dart';

class Controller with ChangeNotifier {
  final Repo _repository = Repo();

  IntroductionHighway? _introductionHighway;
  MotorwayDriving? _motorwayDriving;
  DrivingOnMotorway? _drivingOnMotorway;
  SpeedLimit? _speedLimit;
  ReduceCongestion? _reduceCongestion;
  LaneMarking? _laneMarking;
  StoppingAndBreakdowns? _stoppingAndBreakdowns;
  MeetingTheStandards? _meetingTheStandards;
  ThinkAbout? _thinkAbout;
  ThingsToDiscussWithInstructor? _thingsToDiscussWithInstructor;

  IntroductionHighway? get introductionHighway => _introductionHighway;
  MotorwayDriving? get motorwayDriving => _motorwayDriving;
  DrivingOnMotorway? get drivingOnMotorway => _drivingOnMotorway;
  SpeedLimit? get speedLimit => _speedLimit;
  ReduceCongestion? get reduceCongestion => _reduceCongestion;
  LaneMarking? get laneMarking => _laneMarking;
  StoppingAndBreakdowns? get stoppingAndBreakdowns => _stoppingAndBreakdowns;
  MeetingTheStandards? get meetingTheStandards => _meetingTheStandards;
  ThinkAbout? get thinkAbout => _thinkAbout;
  ThingsToDiscussWithInstructor? get thingsToDiscussWithInstructor =>
      _thingsToDiscussWithInstructor;

  // Fetching data methods
  Future<void> fetchIntroductionHighwayData() async {
    _introductionHighway = await _repository.getIntroductionHighwayData();
    notifyListeners(); // Notify listeners to update UI
  }

  Future<void> fetchMotorwayDrivingData() async {
    _motorwayDriving = await _repository.getMotorwayDrivingData();
    notifyListeners();
  }

  Future<void> fetchDrivingOnMotorwayData() async {
    _drivingOnMotorway = await _repository.getDrivingOnMotorwayData();
    notifyListeners();
  }

  Future<void> fetchSpeedLimitData() async {
    _speedLimit = await _repository.getSpeedLimitData();
    notifyListeners();
  }

  Future<void> fetchReduceCongestionData() async {
    _reduceCongestion = await _repository.getReduceCongestionData();
    notifyListeners();
  }

  Future<void> fetchLaneMarkingData() async {
    _laneMarking = await _repository.getLaneMarkingData();
    notifyListeners();
  }

  Future<void> fetchStoppingAndBreakdownsData() async {
    _stoppingAndBreakdowns = await _repository.getStoppingAndBreakdownsData();
    notifyListeners();
  }

  Future<void> fetchMeetingTheStandardsData() async {
    _meetingTheStandards = await _repository.getMeetingTheStandardsData();
    notifyListeners();
  }

  Future<void> fetchThinkAboutData() async {
    _thinkAbout = await _repository.getThinkAboutData();
    notifyListeners();
  }

  Future<void> fetchThingsToDiscussData() async {
    _thingsToDiscussWithInstructor = await _repository.getThingsToDiscussData();
    notifyListeners();
  }
}
