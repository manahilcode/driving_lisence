import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/learner_drivers_model.dart';

class HighwayCodeLearnerDriversRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection for learner drivers
  Future<HighwayCodeLearnerDrivers?> fetchLearnerDriverInfo() async {
    try {
      DocumentSnapshot doc = await _firebaseFirestore
          .collection("highwaycode_Rules_for_motorcyclists")// Collection name
          .doc('Learner drivers') // Document ID
          .get();

      if (doc.exists) {
        return HighwayCodeLearnerDrivers.fromFirestore(doc);
      }
    } catch (e) {
      print("Error fetching learner drivers data: $e");
    }
    return null;
  }
}
