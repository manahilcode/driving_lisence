import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';

class IncidentRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MeetingStandardIncident?> getMeetingStandardIncident(
      String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('Incidents')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        return MeetingStandardIncident.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  Future<HelpOtherGivingAid?> getHelpOtherGivingAid(String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('Incidents')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        return HelpOtherGivingAid.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  Future<DiscussWithInstructorIncident?> getDiscussWithInstructorIncident(
      String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('Incidents')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        return DiscussWithInstructorIncident.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  Future<IntroductionIncident?> getIntroductionIncident(
      String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('Incidents')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        return IntroductionIncident.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  Future<BreakdownIncident?> getBreakdownIncident(String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('Incidents')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        return BreakdownIncident.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  Future<ReportingIncident?> getReportingIncident(String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('Incidents')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        return ReportingIncident.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  Future<SafetyInTunnel?> getSafetyInTunnel(String documentId) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('Incidents').doc(documentId).get();

      if (snapshot.exists) {
        return SafetyInTunnel.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  Future<StoppingInIncident?> getStoppingInIncident(String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('Incidents')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        return StoppingInIncident.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  Future<ThinkAboutIncident?> getThinkAboutIncident(String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('Incidents')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        return ThinkAboutIncident.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  Future<WarningOthersOfBreak?> getWarningOthersOfBreak(
      String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('Incidents')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        return WarningOthersOfBreak.fromJson(
            snapshot.data() as Map<String, dynamic>);
      } else {
        print('No document found with the provided ID.');
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }
}
