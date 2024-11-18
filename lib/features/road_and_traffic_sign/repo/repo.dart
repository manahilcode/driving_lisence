import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';

class RepositoryRoadSign {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Method to get IntroductionRoadsign data from Firestore
  Future<IntroductionRoadsign?> getIntroductionRoadsign(
      String documentId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot documentSnapshot = await _firestore
          .collection(
              'road_and_traffic_sign') // Assuming your collection is named 'roadsigns'
          .doc(documentId)
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Convert the document data to the IntroductionRoadsign model
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return IntroductionRoadsign.fromJson(data);
      } else {
        print('Document not found');
        return null;
      }
    } catch (e) {
      print('Error getting document: $e');
      return null;
    }
  }

// Method to get SignRoadSign data from Firestore
  Future<SignRoadSign?> getSignRoadSign(String documentId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot documentSnapshot = await _firestore
          .collection('road_and_traffic_sign') // Assuming your collection is named 'signs'
          .doc(documentId)
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Convert the document data to the SignRoadSign model
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return SignRoadSign.fromJson(data);
      } else {
        print('Document not found');
        return null;
      }
    } catch (e) {
      print('Error getting document: $e');
      return null;
    }
  }

  Future<DiscussInstructorRoadSign?> getDiscussInstructorRoadSign(
      String documentId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot documentSnapshot = await _firestore
          .collection(
              'road_and_traffic_sign') // Assuming your collection is named 'discussRoadSigns'
          .doc(documentId)
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Convert the document data to the DiscussInstructorRoadSign model
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return DiscussInstructorRoadSign.fromJson(data);
      } else {
        print('Document not found');
        return null;
      }
    } catch (e) {
      print('Error getting document: $e');
      return null;
    }
  }

// Method to get MeetingStandardRoadSign data from Firestore
  Future<MeetingStandardRoadSign?> getMeetingStandardRoadSign(
      String documentId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot documentSnapshot = await _firestore
          .collection(
              'road_and_traffic_sign') // Assuming your collection is named 'meetingStandardRoadSigns'
          .doc(documentId)
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Convert the document data to the MeetingStandardRoadSign model
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return MeetingStandardRoadSign.fromJson(data);
      } else {
        print('Document not found');
        return null;
      }
    } catch (e) {
      print('Error getting document: $e');
      return null;
    }
  }

// Method to get RoadLaneRoadSign data from Firestore
  Future<RoadLaneRoadSign?> getRoadLaneRoadSign(String documentId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot documentSnapshot = await _firestore
          .collection(
              'road_and_traffic_sign') // Assuming your collection is named 'roadLaneRoadSigns'
          .doc(documentId)
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Convert the document data to the RoadLaneRoadSign model
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return RoadLaneRoadSign.fromJson(data);
      } else {
        print('Document not found');
        return null;
      }
    } catch (e) {
      print('Error getting document: $e');
      return null;
    }
  }

// Method to get RoadMarkingRoadSign data from Firestore
  Future<RoadMarkingRoadSign?> getRoadMarkingRoadSign(String documentId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot documentSnapshot = await _firestore
          .collection(
              'road_and_traffic_sign') // Assuming your collection is named 'roadMarkingRoadSigns'
          .doc(documentId)
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Convert the document data to the RoadMarkingRoadSign model
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return RoadMarkingRoadSign.fromJson(data);
      } else {
        print('Document not found');
        return null;
      }
    } catch (e) {
      print('Error getting document: $e');
      return null;
    }
  }

  Future<DriverSignal?> getDriverSignal(String documentId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('road_and_traffic_sign').doc(documentId).get();

      if (doc.exists) {
        // Convert the document snapshot into a DriverSignal instance
        return DriverSignal.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Error fetching document: $e");
    }
    return null;
  }

  Future<ThinkAboutRoadSign> fetchThinkAboutRoadSign(String documentId) async {
    DocumentSnapshot snapshot = await _firestore
        .collection('road_and_traffic_sign')
        .doc(documentId)
        .get();
    return ThinkAboutRoadSign.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  Future<TrafficLightAndWarning> fetchTrafficLightAndWarning(String documentId) async {
    try {
      // Fetch the document from Firestore
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('road_and_traffic_sign')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        // Convert the snapshot data to the model
        return TrafficLightAndWarning.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
