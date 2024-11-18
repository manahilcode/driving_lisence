import 'package:flutter/material.dart';

import '../model/model.dart';
import '../repo/repo.dart';

class EssentialDocumentsController extends ChangeNotifier {
  final EssentialsRepository repository = EssentialsRepository();

  // Introduction Essential
  IntroductionEssentialDocument? _introductionEssential;
  IntroductionEssentialDocument? get introductionEssential => _introductionEssential;

  // Discuss Instructor
  DiscussInstructorDocument? _discussInstructor;
  DiscussInstructorDocument? get discussInstructor => _discussInstructor;

  // Essential Document
  EssentialDocument? _essential;
  EssentialDocument? get essential => _essential;

  // Insurance Essential
  InsuranceEssentialDocument? _insuranceEssential;
  InsuranceEssentialDocument? get insuranceEssential => _insuranceEssential;

  // Meeting Standard Essential
  MeetingStandardEssentialDocument? _meetingStandardEssential;
  MeetingStandardEssentialDocument? get meetingStandardEssential => _meetingStandardEssential;

  // MOT Test
  MotTest? _motTest;
  MotTest? get motTest => _motTest;

  // Registering and Owning Car
  RegisteringAndOwningCar? _registeringAndOwningCar;
  RegisteringAndOwningCar? get registeringAndOwningCar => _registeringAndOwningCar;

  // Think About Essential
  ThinkAboutEssentialDocument? _thinkAboutEssential;
  ThinkAboutEssentialDocument? get thinkAboutEssential => _thinkAboutEssential;

  DrivingLicence? _drivingLicence;
  DrivingLicence? get drivingLicence => _drivingLicence;

  // Fetch methods
  Future<void> fetchIntroductionEssential(String documentId) async {
    _introductionEssential = await repository.getIntroductionEssential(documentId);
    notifyListeners();
  }

  Future<void> fetchDiscussInstructor(String documentId) async {
    _discussInstructor = await repository.getDiscussInstructor(documentId);
    notifyListeners();
  }

  Future<void> fetchEssential(String documentId) async {
    _essential = await repository.getEssential(documentId);
    notifyListeners();
  }

  Future<void> fetchInsuranceEssential(String documentId) async {
    _insuranceEssential = await repository.getInsuranceEssential(documentId);
    notifyListeners();
  }

  Future<void> fetchMeetingStandardEssential(String documentId) async {
    _meetingStandardEssential = await repository.getMeetingStandardEssential(documentId);
    notifyListeners();
  }

  Future<void> fetchMotTest(String documentId) async {
    _motTest = await repository.getMotTest(documentId);
    notifyListeners();
  }

  Future<void> fetchRegisteringAndOwningCar(String documentId) async {
    _registeringAndOwningCar = await repository.getRegisteringAndOwningCar(documentId);
    notifyListeners();
  }

  Future<void> fetchThinkAboutEssential(String documentId) async {
    _thinkAboutEssential = await repository.getThinkAboutEssential(documentId);
    notifyListeners();
  }
  Future<void> fetchDrivingLicence(String documentId) async {
    _drivingLicence = await repository.getDrivingLicence(documentId);
    notifyListeners();
  }



  // Clear all data
  void clearAll() {
    _introductionEssential = null;
    _discussInstructor = null;
    _essential = null;
    _insuranceEssential = null;
    _meetingStandardEssential = null;
    _motTest = null;
    _registeringAndOwningCar = null;
    _thinkAboutEssential = null;
    notifyListeners();
  }
}