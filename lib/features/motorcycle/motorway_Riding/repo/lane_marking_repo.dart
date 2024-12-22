import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../motor_way_Driving/model/model.dart';
import '../model/lane_marking.dart';

class LaneMarkingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get data from Firestore
  Future<LaneMarkingRiding> getLaneMarking() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('lane_markings') // Collection name in Firestore
          .doc('lane_marking_doc') // Document ID
          .get();

      if (doc.exists) {
        return LaneMarkingRiding.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Lane marking not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
