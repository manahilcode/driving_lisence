import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/lighting_requirement_model.dart';

class LightingRequirementRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<LightingRequirement> fetchLightingRequirementData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_General_rules_techniques_and_advice_for_all_drivers_and_riders") // Collection name
          .doc('Lighting requirements') // Document ID
          .get();

      if (docSnapshot.exists) {
        return LightingRequirement.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
