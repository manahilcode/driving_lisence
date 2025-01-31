import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/line_lane_marketing_model.dart';

class LinesAndLaneMarkingsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<LinesAndLaneMarkings> fetchLinesAndLaneMarkingsData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_General_rules_techniques_and_advice_for_all_drivers_and_riders") // Collection name
          .doc('Lines_and_lane_markings_on_the_road') // Document ID
          .get();

      if (docSnapshot.exists) {
        return LinesAndLaneMarkings.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
