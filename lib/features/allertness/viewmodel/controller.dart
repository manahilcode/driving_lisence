import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';
import '../repo/repo.dart';

class AlertController with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AlertRepo _alertRepo = AlertRepo();
  IntroductionAlert? _introductionAlert;
  ObservationAwareness? _observationAwareness;
  Anticipation? _anticipation;
  AvoidingTiredness? _avoidingTiredness;
  Distraction? _distraction;
  ThinkAboutAlert? _thinkAboutAlert;
  BeingSeenByOthers? _beingSeenByOthers;
  DiscussInstructorAlert? _discussInstructorAlert;
  ClearViewAlert? _clearViewAlert;
  MeetingStandardAlert? _meetingStandardAlert;
  OvertakingAlert? _overtakingAlert;
  StayingFocusedAlert? _stayingFocusedAlert;

  // Getters for the models
  IntroductionAlert? get introductionAlert => _introductionAlert;
  ObservationAwareness? get observationAwareness => _observationAwareness;
  Anticipation? get anticipation => _anticipation;
  AvoidingTiredness? get avoidingTiredness => _avoidingTiredness;
  Distraction? get distraction => _distraction;
  ThinkAboutAlert? get thinkAboutAlert => _thinkAboutAlert;
  BeingSeenByOthers? get beingSeenByOthers => _beingSeenByOthers;
  DiscussInstructorAlert? get discussInstructorAlert => _discussInstructorAlert;
  ClearViewAlert? get clearViewAlert => _clearViewAlert;
  MeetingStandardAlert? get meetingStandardAlert => _meetingStandardAlert;
  OvertakingAlert? get overtakingAlert => _overtakingAlert;
  StayingFocusedAlert? get stayfocus => _stayingFocusedAlert;

  // Fetch IntroductionAlert
  Future<void> fetchIntroductionAlert() async {
    _introductionAlert = await _alertRepo.getIntroductionAlert();
    notifyListeners();
  }

  // Fetch ObservationAwareness
  Future<void> fetchObservationAwareness() async {
    _observationAwareness = await _alertRepo.getObservationAwareness();
    notifyListeners();
  }

  // Fetch Anticipation
  Future<void> fetchAnticipation() async {
    _anticipation = await _alertRepo.getAnticipation();
    notifyListeners();
  }

  // Fetch AvoidingTiredness
  Future<void> fetchAvoidingTiredness() async {
    _avoidingTiredness = await _alertRepo.getAvoidingTiredness();
    notifyListeners();
  }

  // Fetch Distraction
  Future<void> fetchDistraction() async {
    _distraction = await _alertRepo.getDistraction();
    notifyListeners();
  }

  // Fetch ThinkAboutAlert
  Future<void> fetchThinkAboutAlert() async {
    _thinkAboutAlert = await _alertRepo.getThinkAboutAlert();;
    notifyListeners();
  }

  // Fetch BeingSeenByOthers
  Future<void> fetchBeingSeenByOthers() async {
    _beingSeenByOthers = await _alertRepo.getBeingSeenByOthers();;
    notifyListeners();
  }

  // Fetch DiscussInstructorAlert
  Future<void> fetchDiscussInstructorAlert() async {
    _discussInstructorAlert = await _alertRepo.getDiscussInstructorAlert();
    notifyListeners();
  }

  // Fetch ClearViewAlert
  Future<void> fetchClearViewAlert() async {
    _clearViewAlert = await _alertRepo.getClearViewAlert();
    notifyListeners();
  }

  // Fetch MeetingStandardAlert
  Future<void> fetchMeetingStandardAlert() async {
    _meetingStandardAlert = await _alertRepo.getMeetingStandardAlert();
    notifyListeners();
  }

  Future<void> fetchOverTaking() async {
    _overtakingAlert = await _alertRepo.getOvertakingAlert();
    notifyListeners();
  }

  Future<void> fetchStayFocus() async {
    _stayingFocusedAlert = await _alertRepo.getStayFocus();
    notifyListeners();
  }

  // // Generic function to fetch alert data
  // Future<T?> _fetchAlert<T>(String docId) async {
  //   try {
  //     DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc(docId).get();
  //     if (doc.exists) {
  //       if (T == IntroductionAlert) {
  //         return IntroductionAlert.fromJson(doc.data() as Map<String, dynamic>) as T;
  //       } else if (T == ObservationAwareness) {
  //         return ObservationAwareness.fromJson(doc.data() as Map<String, dynamic>) as T;
  //       } else if (T == Anticipation) {
  //         return Anticipation.fromJson(doc.data() as Map<String, dynamic>) as T;
  //       } else if (T == AvoidingTiredness) {
  //         return AvoidingTiredness.fromJson(doc.data() as Map<String, dynamic>) as T;
  //       } else if (T == Distraction) {
  //         return Distraction.fromJson(doc.data() as Map<String, dynamic>) as T;
  //       } else if (T == ThinkAboutAlert) {
  //         return ThinkAboutAlert.fromJson(doc.data() as Map<String, dynamic>) as T;
  //       } else if (T == BeingSeenByOthers) {
  //         return BeingSeenByOthers.fromJson(doc.data() as Map<String, dynamic>) as T;
  //       } else if (T == DiscussInstructorAlert) {
  //         return DiscussInstructorAlert.fromJson(doc.data() as Map<String, dynamic>) as T;
  //       } else if (T == ClearViewAlert) {
  //         return ClearViewAlert.fromJson(doc.data() as Map<String, dynamic>) as T;
  //       } else if (T == MeetingStandardAlert) {
  //         return MeetingStandardAlert.fromJson(doc.data() as Map<String, dynamic>) as T;
  //       }
  //     }
  //   } catch (e) {
  //     print('Error fetching alert: $e');
  //   }
  //   return null;
  // }
}
