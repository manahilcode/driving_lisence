// Repository class for TheRoadUserAndTheLaw
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/the_road_user_law_model.dart';

class TheRoadUserAndTheLawRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection and document
  Future<TheRoadUserAndTheLaw> fetchTheRoadUserAndTheLawData(String documentId) async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_General_rules_techniques_and_advice_for_all_drivers_and_riders")// Firestore collection name
          .doc(documentId) // Firestore document ID
          .get();

      if (docSnapshot.exists) {
        return TheRoadUserAndTheLaw.fromFirestore(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}