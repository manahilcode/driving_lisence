import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';

class AlertRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to fetch IntroductionAlert
  Future<IntroductionAlert?> getIntroductionAlert() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('Introduction').get();
      if (doc.exists) {
        return IntroductionAlert.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching IntroductionAlert: $e');
    }
    return null;
  }

  // Function to fetch ObservationAwareness
  Future<ObservationAwareness?> getObservationAwareness() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('observation_and_awareness').get();
      if (doc.exists) {
        return ObservationAwareness.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching ObservationAwareness: $e');
    }
    return null;
  }

  // Function to fetch Anticipation
  Future<Anticipation?> getAnticipation() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('Anticipation').get();
      if (doc.exists) {
        return Anticipation.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching Anticipation: $e');
    }
    return null;
  }

  // Function to fetch AvoidingTiredness
  Future<AvoidingTiredness?> getAvoidingTiredness() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('Avoiding_tiredness').get();
      if (doc.exists) {
        return AvoidingTiredness.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching AvoidingTiredness: $e');
    }
    return null;
  }

  // Function to fetch Distraction
  Future<Distraction?> getDistraction() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('Distraction').get();
      if (doc.exists) {
        print(doc.data());
        return Distraction.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching Distraction: $e');
    }
    return null;
  }

  // Function to fetch ThinkAboutAlert
  Future<ThinkAboutAlert?> getThinkAboutAlert() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('Think_about').get();
      if (doc.exists) {
        return ThinkAboutAlert.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching ThinkAboutAlert: $e');
    }
    return null;
  }

  // Function to fetch BeingSeenByOthers
  Future<BeingSeenByOthers?> getBeingSeenByOthers() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('being_seen_by_others').get();
      if (doc.exists) {
        return BeingSeenByOthers.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching BeingSeenByOthers: $e');
    }
    return null;
  }

  // Function to fetch DiscussInstructorAlert
  Future<DiscussInstructorAlert?> getDiscussInstructorAlert() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('discuss_with_your_instructor').get();
      if (doc.exists) {
        return DiscussInstructorAlert.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching DiscussInstructorAlert: $e');
    }
    return null;
  }

  // Function to fetch ClearViewAlert
  Future<ClearViewAlert?> getClearViewAlert() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('getting_clear_view').get();
      if (doc.exists) {
        return ClearViewAlert.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching ClearViewAlert: $e');
    }
    return null;
  }

  // Function to fetch MeetingStandardAlert
  Future<MeetingStandardAlert?> getMeetingStandardAlert() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('meeting_the_standard').get();
      if (doc.exists) {
        return MeetingStandardAlert.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching MeetingStandardAlert: $e');
    }
    return null;
  }


  // Function to fetch MeetingStandardAlert
  Future<OvertakingAlert?> getOvertakingAlert() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('over_taking').get();
      if (doc.exists) {
        return OvertakingAlert.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching MeetingStandardAlert: $e');
    }
    return null;
  }
  Future<StayingFocusedAlert?> getStayFocus() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('first_category(alertness)').doc('stay_focused').get();
      if (doc.exists) {
        return StayingFocusedAlert.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching MeetingStandardAlert: $e');
    }
    return null;
  }
}
