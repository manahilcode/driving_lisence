import 'package:flutter/cupertino.dart';

import '../../vehicle_handling/repo/repo.dart';
import '../model/model.dart';

import 'package:flutter/foundation.dart';

import '../repo/repo.dart'; // Ensure to import ChangeNotifier

class RuleRoadController extends ChangeNotifier {
  // Models
  StoppingAndParking? stoppingAndParking;
  SmokingInCar? smokingInCar;
  MeetingStandards? meetingStandards;
  ThinkAbout? thinkAbout;
  ThingsToDiscussPractice? thingsToDiscussPractice;
  IntroductionRuleRoad? _introductionRuleRoad;
  SpeedLimit? _speedLimit;
  SpeedLimit2? _speedLimit2;
  LanesAndJunctions? _lanesAndJunctions;
  LaneAndJunction2? _laneAndJunction2;
  Overtaking? _overtaking;
  Reversing? _reversing;
  PedestrianCrossing? _pedestrianCrossing;
  LevelCrossing? _levelCrossing;

  // Getters
  StoppingAndParking? get stoppingAndParkingValue => stoppingAndParking;
  SmokingInCar? get smokingInCarValue => smokingInCar;
  MeetingStandards? get meetingStandardsValue => meetingStandards;
  ThinkAbout? get thinkAboutValue => thinkAbout;
  ThingsToDiscussPractice? get thingsToDiscussPracticeValue =>
      thingsToDiscussPractice;
  IntroductionRuleRoad? get introductionRuleRoadValue => _introductionRuleRoad;
  SpeedLimit? get speedLimitValue => _speedLimit;
  SpeedLimit2? get speedLimit2Value => _speedLimit2;
  LanesAndJunctions? get lanesAndJunctionsValue => _lanesAndJunctions;
  LaneAndJunction2? get laneAndJunction2Value => _laneAndJunction2;
  Overtaking? get overtakingValue => _overtaking;
  Reversing? get reversingValue => _reversing;
  PedestrianCrossing? get pedestrianCrossingValue => _pedestrianCrossing;
  LevelCrossing? get levelCrossingValue => _levelCrossing;

  // Repository instance
  RepositoryRuleRoad _repository = RepositoryRuleRoad();

  // Example method to update a value
  void updateStoppingAndParking(StoppingAndParking value) {
    stoppingAndParking = value;
    notifyListeners();
  }

  Future<void> fetchIntroductionRuleRoad() async {
    _introductionRuleRoad =
        await _repository.getIntroductionRuleRoadData("introduction");
    notifyListeners();
  }

  Future<void> fetchSpeedLimit() async {
    _speedLimit = await _repository.getSpeedLimitData("speed_limit");
    notifyListeners();
  }

  Future<void> fetchSpeedLimit2() async {
    _speedLimit2 = await _repository.getSpeedLimit2Data("speed_limit_2");
    notifyListeners();
  }

  Future<void> fetchLanesAndJunctions() async {
    _lanesAndJunctions = await _repository.getLanesAndJunctionsData("lanes_and_junction");
    notifyListeners();
  }

  Future<void> fetchLaneAndJunction2() async {
    _laneAndJunction2 = await _repository.getLaneAndJunction2Data("lanes_and_junction2");
    notifyListeners();
  }

  Future<void> fetchOvertaking() async {
    _overtaking = await _repository.getOvertakingData("overtaking");
    notifyListeners();
  }

  Future<void> fetchReversing() async {
    _reversing = await _repository.getReversingData("Reversing");
    notifyListeners();
  }

  Future<void> fetchPedestrianCrossing() async {
    _pedestrianCrossing = await _repository.getPedestrianCrossingData("Pedestrian_crossings");
    notifyListeners();
  }

  Future<void> fetchLevelCrossing() async {
    _levelCrossing = await _repository.getLevelCrossingData("level_crossing");
    notifyListeners();
  }

  Future<void> fetchStoppingAndParking() async {
    stoppingAndParking = await _repository.getStoppingAndParkingData("stopping_and_parking");
    notifyListeners();
  }

  Future<void> fetchSmokingInCar() async {
    smokingInCar = await _repository.getSmokingInCarData("smoking_inthe_car");
    notifyListeners();
  }

  Future<void> fetchMeetingStandards() async {
    meetingStandards = await _repository.getMeetingStandardsData("meeting_the_standard");
    notifyListeners();
  }

  Future<void> fetchThinkAbout() async {
    thinkAbout = await _repository.getThinkAboutData("think_about");
    notifyListeners();
  }

  Future<void> fetchThingsToDiscussPractice() async {
    thingsToDiscussPractice =
        await _repository.getThingsToDiscussPracticeData("thinks_to_discuss_with_instructor");
    notifyListeners();
  }
}
