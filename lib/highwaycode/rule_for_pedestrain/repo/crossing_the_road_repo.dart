import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/crossing_model.dart';
import '../model/crossing_the_road_model.dart';

class HighwayCrossingRepository11 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCrossingModel> fetchHighwayCrossingData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection("highwaycode_Rules_for_pedestrians").doc('"Crossing the road"').get();

      if (doc.exists) {
        return HighwayCrossingModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
