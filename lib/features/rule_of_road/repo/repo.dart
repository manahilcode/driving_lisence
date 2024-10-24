import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';

class RepositoryRuleRoad {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<IntroductionRuleRoad?> getIntroductionRuleRoadData(
      String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to IntroductionRuleRoad model
        return IntroductionRuleRoad.fromJson(
            doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<SpeedLimit?> getSpeedLimitData(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to SpeedLimit model
        return SpeedLimit.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<SpeedLimit2?> getSpeedLimit2Data(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to SpeedLimit2 model
        return SpeedLimit2.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<LanesAndJunctions?> getLanesAndJunctionsData(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to LanesAndJunctions model
        return LanesAndJunctions.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<LaneAndJunction2?> getLaneAndJunction2Data(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to LaneAndJunction2 model
        return LaneAndJunction2.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<Overtaking?> getOvertakingData(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to Overtaking model
        return Overtaking.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<Reversing?> getReversingData(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to Reversing model
        return Reversing.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<PedestrianCrossing?> getPedestrianCrossingData(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to PedestrianCrossing model
        return PedestrianCrossing.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<LevelCrossing?> getLevelCrossingData(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to LevelCrossing model
        return LevelCrossing.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<StoppingAndParking?> getStoppingAndParkingData(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to StoppingAndParking model
        return StoppingAndParking.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<SmokingInCar?> getSmokingInCarData(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to SmokingInCar model
        return SmokingInCar.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<MeetingStandards?> getMeetingStandardsData(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to MeetingStandards model
        return MeetingStandards.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<ThinkAbout?> getThinkAboutData(String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to ThinkAbout model
        return ThinkAbout.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  Future<ThingsToDiscussPractice?> getThingsToDiscussPracticeData(
      String docId) async {
    try {
      // Fetch document from Firestore
      DocumentSnapshot doc =
          await _firestore.collection('rules_of_the_road').doc(docId).get();

      if (doc.exists) {
        // Map Firestore data to ThingsToDiscussPractice model
        return ThingsToDiscussPractice.fromJson(
            doc.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
