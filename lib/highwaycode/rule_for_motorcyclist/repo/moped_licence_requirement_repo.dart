import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/moped_licence_requirement_model.dart';

class MopedLicenceRequirements11Repository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection for moped licence requirements
  Future<MopedLicenceRequirements11?> fetchMopedLicenceRequirements11() async {
    try {
      DocumentSnapshot doc = await _firebaseFirestore
          .collection("highwaycode_Rules_for_motorcyclists")// Collection name
          .doc('Moped_licence_requirements') // Document ID
          .get();

      if (doc.exists) {
        return MopedLicenceRequirements11.fromFirestore(doc);
      }
    } catch (e) {
      print("Error fetching moped licence requirements data: $e");
    }
    return null;
  }
}
