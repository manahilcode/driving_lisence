import 'package:flutter/material.dart';
import '../model/models.dart';
import '../repo/repo.dart'; // Adjust the import as necessary

class VulnerableController with ChangeNotifier {
  final VulnerableRepo _repo = VulnerableRepo();

  CyclistVulnerable? _cyclistSafety;
  VulnerableRoadIntroduction? _vulnerableRoadIntroduction;
  PedestrianVulnerableRoad? _pedestrianVulnerableRoad;
  VulnerableRoadUser? _vulnerableRoadUser;
  OlderDisabledPedestrians? _olderDisabledPedestrians;

  CyclistVulnerable? get cyclistSafety => _cyclistSafety;
  VulnerableRoadIntroduction? get vulnerableRoadIntroduction => _vulnerableRoadIntroduction;
  PedestrianVulnerableRoad? get pedestrianVulnerableRoad => _pedestrianVulnerableRoad;
  VulnerableRoadUser? get vulnerableRoadUser => _vulnerableRoadUser;
  OlderDisabledPedestrians? get olderDisabledPedestrians => _olderDisabledPedestrians;

  RoadObjectAndMotorcyclist?  _motocycle ;
  RoadObjectAndMotorcyclist? get  motorcycle =>_motocycle;

  AnimalsVulnerable? _animalsVulnerable;
  DiscussInstructorVulnerable? _discussInstructorVulnerable;
  MeetingStandardVulnerable? _meetingStandardVulnerable;
  OtherDriverVulnerable? _otherDriverVulnerable;
  ThinkAboutVulnerable? _thinkAboutVulnerable;

  AnimalsVulnerable? get animalsVulnerable => _animalsVulnerable;
  DiscussInstructorVulnerable? get discussInstructorVulnerable => _discussInstructorVulnerable;
  MeetingStandardVulnerable? get meetingStandardVulnerable => _meetingStandardVulnerable;
  OtherDriverVulnerable? get otherDriverVulnerable => _otherDriverVulnerable;
  ThinkAboutVulnerable? get thinkAboutVulnerable => _thinkAboutVulnerable;


  Future<void> fetchCyclistSafety() async {
    _cyclistSafety = await _repo.getCyclistSafety();
    print(_cyclistSafety);
    notifyListeners();
  }

  Future<void> fetchVulnerableRoadIntroduction() async {
    _vulnerableRoadIntroduction = await _repo.getVulnerableRoadIntroduction();
    notifyListeners();
  }

  Future<void> fetchPedestrianVulnerableRoad() async {
    _pedestrianVulnerableRoad = await _repo.getPedestrianVulnerableRoad();
    notifyListeners();
  }

  Future<void> fetchVulnerableRoadUser() async {
    _vulnerableRoadUser = await _repo.getVulnerableRoadUser();
    notifyListeners();
  }

  Future<void> fetchOlderDisabledPedestrians() async {
    _olderDisabledPedestrians = await _repo.getOlderDisabledPedestrians();
    notifyListeners();
  }

  Future<void> fetchMotorcycle() async {
    _motocycle = await _repo.getRoadObjectAndMotorcyclists();
    notifyListeners();
  }

  Future<void> fetchAnimalsVulnerable() async {
    _animalsVulnerable =  await   _repo.getAnimalsVulnerable();
   notifyListeners();

  }

  Future<void> fetchDiscussInstructorVulnerable() async {
    _discussInstructorVulnerable =  await   _repo.getDiscussInstructorVulnerable();
    notifyListeners();  }

  Future<void> fetchMeetingStandardVulnerable() async {
    _meetingStandardVulnerable =  await   _repo.getMeetingStandardVulnerable();
    notifyListeners();  }

  Future<void> fetchOtherDriverVulnerable() async {
    _otherDriverVulnerable =  await   _repo.getOtherDriverVulnerable();
    notifyListeners();  }

  Future<void> fetchThinkAboutVulnerable() async {
    _thinkAboutVulnerable =  await   _repo.getThinkAboutVulnerable();
    notifyListeners();  }
}
