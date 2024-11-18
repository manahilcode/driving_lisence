import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/models.dart';

class VulnerableRepo {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<CyclistVulnerable?> getCyclistSafety() async {
    try {
      DocumentSnapshot? doc = await _db.collection('Vulnerable_road_users').doc("Cyclists").get();
      if (doc.exists && doc.data() != null) {
        return CyclistVulnerable.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching CyclistSafety: $e');
    }
    return null;
  }
  Future<VulnerableRoadIntroduction?> getVulnerableRoadIntroduction() async {
    try {
      DocumentSnapshot doc = await _db
          .collection('Vulnerable_road_users')
          .doc("Introduction")
          .get();
      if (doc.exists) {
        return VulnerableRoadIntroduction.fromJson(
            doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching VulnerableRoadIntroduction: $e');
    }
    return null;
  }

  Future<PedestrianVulnerableRoad?> getPedestrianVulnerableRoad() async {
    try {
      DocumentSnapshot doc = await _db
          .collection('Vulnerable_road_users')
          .doc("Pedestrians")
          .get();
      if (doc.exists) {
        return PedestrianVulnerableRoad.fromJson(
            doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching PedestrianVulnerableRoad: $e');
    }
    return null;
  }

  Future<VulnerableRoadUser?> getVulnerableRoadUser() async {
    try {
      DocumentSnapshot doc =
          await _db.collection('Vulnerable_road_users').doc("Vulnerable_road_users").get();
      if (doc.exists) {
        return VulnerableRoadUser.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching VulnerableRoadUser: $e');
    }
    return null;
  }

  Future<OlderDisabledPedestrians?> getOlderDisabledPedestrians() async {
    try {
      DocumentSnapshot doc = await _db
          .collection('Vulnerable_road_users')
          .doc("older_and_disabled_pedestrians")
          .get();
      if (doc.exists) {
        return OlderDisabledPedestrians.fromJson(
            doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching OlderDisabledPedestrians: $e');
    }
    return null;
  }
  Future<RoadObjectAndMotorcyclist?> getRoadObjectAndMotorcyclists() async {
    try {
      DocumentSnapshot doc = await _db
          .collection('Vulnerable_road_users')
          .doc("motocycle")
          .get();
      if (doc.exists) {
        return RoadObjectAndMotorcyclist.fromJson(
            doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching OlderDisabledPedestrians: $e');
    }
    return null;
  }

  Future<AnimalsVulnerable?> getAnimalsVulnerable() async {
    try {
      DocumentSnapshot doc = await _db.collection('Vulnerable_road_users').doc("animals").get();
      if (doc.exists) {
        return AnimalsVulnerable.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching AnimalsVulnerable: $e');
    }
    return null;
  }

  Future<DiscussInstructorVulnerable?> getDiscussInstructorVulnerable() async {
    try {
      DocumentSnapshot doc = await _db.collection('Vulnerable_road_users').doc('discuss_instructor').get();
      if (doc.exists) {
        return DiscussInstructorVulnerable.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching DiscussInstructorVulnerable: $e');
    }
    return null;
  }

  Future<MeetingStandardVulnerable?> getMeetingStandardVulnerable() async {
    try {
      DocumentSnapshot doc = await _db.collection('Vulnerable_road_users').doc('meeting_the_standard').get();
      if (doc.exists) {
        return MeetingStandardVulnerable.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching MeetingStandardVulnerable: $e');
    }
    return null;
  }

  Future<OtherDriverVulnerable?> getOtherDriverVulnerable() async {
    try {
      DocumentSnapshot doc = await _db.collection('Vulnerable_road_users').doc('other_driver').get();
      if (doc.exists) {
        return OtherDriverVulnerable.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching OtherDriverVulnerable: $e');
    }
    return null;
  }

  Future<ThinkAboutVulnerable?> getThinkAboutVulnerable() async {
    try {
      DocumentSnapshot doc = await _db.collection('Vulnerable_road_users').doc('think_about').get();
      if (doc.exists) {
        return ThinkAboutVulnerable.fromJson(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching ThinkAboutVulnerable: $e');
    }
    return null;
  }
}
