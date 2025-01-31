import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/junction_controlled_by_traffic_lights_model.dart';
import '../viewmodel/junction_controlled_by_traffic_lights_controller.dart';

class JunctionsControlledByTrafficLightsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<JunctionsControlledByTrafficLights> fetchJunctionsData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_General_rules_techniques_and_advice_for_all_drivers_and_riders") // Collection name
          .doc('Junctions controlled by traffic lights') // Document ID
          .get();

      if (docSnapshot.exists) {
        return JunctionsControlledByTrafficLights.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
