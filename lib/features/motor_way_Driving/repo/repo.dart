import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';

class Repo {


  Future<IntroductionHighway?> getIntroductionHighwayData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('Motorway driving') // Replace with your collection name
          .doc('Introduction') // Replace with your document ID
          .get();

      if (doc.exists) {
        return IntroductionHighway.fromFirestore(
            doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }


  Future<MotorwayDriving?> getMotorwayDrivingData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('Motorway driving') // Replace with your collection name
          .doc('Motorway_driving')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return MotorwayDriving.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  Future<DrivingOnMotorway?> getDrivingOnMotorwayData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('Motorway driving') // Replace with your collection name
          .doc('Driving on the motorway')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return DrivingOnMotorway.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  Future<SpeedLimit?> getSpeedLimitData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('Motorway driving') // Replace with your collection name
          .doc('speed_limit')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return SpeedLimit.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  Future<ReduceCongestion?> getReduceCongestionData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('Motorway driving') // Replace with your collection name
          .doc('Reducing congestion')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return ReduceCongestion.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  Future<LaneMarking?> getLaneMarkingData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('Motorway driving') // Replace with your collection name
          .doc('Lane markings')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return LaneMarking.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }
  Future<StoppingAndBreakdowns?> getStoppingAndBreakdownsData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('Motorway driving') // Replace with your collection name
          .doc('Stopping and breakdowns')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return StoppingAndBreakdowns.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }
  Future<MeetingTheStandards?> getMeetingTheStandardsData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('yourCollection') // Replace with your collection name
          .doc('yourDocumentId')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return MeetingTheStandards.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }


  Future<ThinkAbout?> getThinkAboutData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('yourCollection') // Replace with your collection name
          .doc('yourDocumentId')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return ThinkAbout.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  Future<ThingsToDiscussWithInstructor?> getThingsToDiscussData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('yourCollection') // Replace with your collection name
          .doc('yourDocumentId')         // Replace with your document ID
          .get();

      if (doc.exists) {
        return ThingsToDiscussWithInstructor.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        print("Document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }


}