import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/driving_in_built_up_areas_model.dart';

class DrivingInBuiltUpAreaRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection and document
  Future<DrivingInBuiltUpArea> fetchDrivingInBuiltUpAreaData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_General_rules_techniques_and_advice_for_all_drivers_and_riders")// Specify your collection name
          .doc('Driving in built-up areas')                       // Specify your document ID
          .get();

      if (docSnapshot.exists) {
        return DrivingInBuiltUpArea.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
