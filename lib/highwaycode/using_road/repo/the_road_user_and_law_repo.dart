import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/the_road_user_and_law_model.dart';

class RoadUserAndTheLawRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<RoadUserAndTheLaw> getRoadUserAndTheLawData() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('highwaycode_Using_the_road').doc('The road user and the law').get();

      if (doc.exists) {
        return RoadUserAndTheLaw.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
