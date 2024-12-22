import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/traffic_calming.dart';

class TrafficCalmingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<TrafficCalmingHandling?> fetchTrafficCalming(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return TrafficCalmingHandling.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching TrafficCalming data: $e');
      return null;
    }
  }
}
