import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '../model/model.dart';
import '../repo/repo.dart'; // Adjust the import based on your project structure

class IncidentController extends ChangeNotifier {
  final IncidentRepo _repo = IncidentRepo();

  MeetingStandardIncident? _meetingStandardIncident;
  HelpOtherGivingAid? _helpOtherGivingAid;
  DiscussWithInstructorIncident? _discussWithInstructorIncident;
  IntroductionIncident? _introductionIncident;
  BreakdownIncident? _breakdownIncident;
  ReportingIncident? _reportingIncident;
  SafetyInTunnel? _safetyInTunnel;
  StoppingInIncident? _stoppingInIncident;
  ThinkAboutIncident? _thinkAboutIncident;
  WarningOthersOfBreak? _warningOthersOfBreak;

  // Getters
  MeetingStandardIncident? get meetingStandardIncident => _meetingStandardIncident;
  HelpOtherGivingAid? get helpOtherGivingAid => _helpOtherGivingAid;
  DiscussWithInstructorIncident? get discussWithInstructorIncident => _discussWithInstructorIncident;
  IntroductionIncident? get introductionIncident => _introductionIncident;
  BreakdownIncident? get breakdownIncident => _breakdownIncident;
  ReportingIncident? get reportingIncident => _reportingIncident;
  SafetyInTunnel? get safetyInTunnel => _safetyInTunnel;
  StoppingInIncident? get stoppingInIncident => _stoppingInIncident;
  ThinkAboutIncident? get thinkAboutIncident => _thinkAboutIncident;
  WarningOthersOfBreak? get warningOthersOfBreak => _warningOthersOfBreak;

  // Fetch methods
  Future<void> fetchMeetingStandardIncident(String documentId) async {
    _meetingStandardIncident = await _repo.getMeetingStandardIncident(documentId);
    notifyListeners();
  }

  Future<void> fetchHelpOtherGivingAid(String documentId) async {
    _helpOtherGivingAid = await _repo.getHelpOtherGivingAid(documentId);
    notifyListeners();
  }

  Future<void> fetchDiscussWithInstructorIncident(String documentId) async {
    _discussWithInstructorIncident = await _repo.getDiscussWithInstructorIncident(documentId);
    notifyListeners();
  }

  Future<void> fetchIntroductionIncident(String documentId) async {
    _introductionIncident = await _repo.getIntroductionIncident(documentId);
    notifyListeners();
  }

  Future<void> fetchBreakdownIncident(String documentId) async {
    _breakdownIncident = await _repo.getBreakdownIncident(documentId);
    notifyListeners();
  }

  Future<void> fetchReportingIncident(String documentId) async {
    _reportingIncident = await _repo.getReportingIncident(documentId);
    notifyListeners();
  }

  Future<void> fetchSafetyInTunnel(String documentId) async {
    _safetyInTunnel = await _repo.getSafetyInTunnel(documentId);
    notifyListeners();
  }

  Future<void> fetchStoppingInIncident(String documentId) async {
    _stoppingInIncident = await _repo.getStoppingInIncident(documentId);
    notifyListeners();
  }

  Future<void> fetchThinkAboutIncident(String documentId) async {
    _thinkAboutIncident = await _repo.getThinkAboutIncident(documentId);
    notifyListeners();
  }

  Future<void> fetchWarningOthersOfBreak(String documentId) async {
    _warningOthersOfBreak = await _repo.getWarningOthersOfBreak(documentId);
    notifyListeners();
  }
}
