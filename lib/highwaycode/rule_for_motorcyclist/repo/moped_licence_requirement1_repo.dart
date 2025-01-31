import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/moped_licence_requirement1_model.dart';

class MopedLicenseRequirementsRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection for moped license requirements
  Future<MopedLicenseRequirements?> fetchMopedLicenseRequirements() async {
    try {
      DocumentSnapshot doc = await _firebaseFirestore
          .collection("highwaycode_Rules_for_motorcyclists")// Collection name
          .doc('Moped licence requirements') // Document ID
          .get();

      if (doc.exists) {
        return MopedLicenseRequirements.fromFirestore(doc);
      }
    } catch (e) {
      print("Error fetching moped license requirements data: $e");
    }
    return null;
  }
}
