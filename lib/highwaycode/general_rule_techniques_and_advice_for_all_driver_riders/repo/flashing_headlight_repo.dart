import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/flashing_headlight_model.dart';

class FlashingHeadlightsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FlashingHeadlights> fetchFlashingHeadlightsData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_General_rules_techniques_and_advice_for_all_drivers_and_riders") // Collection name
          .doc('Flashing headlights')                    // Document ID
          .get();

      if (docSnapshot.exists) {
        return FlashingHeadlights.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
