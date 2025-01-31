import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/motorcycle_licence_requirement_model.dart';

class MotorcycleLicenceRequirements33Repository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection for motorcycle licence requirements
  Future<MotorcycleLicenceRequirements33?> fetchMotorcycleLicenceRequirements33() async {
    try {
      DocumentSnapshot doc = await _firebaseFirestore
          .collection("highwaycode_Rules_for_motorcyclists")// Collection name
          .doc('Motorcycle_licence_requirements') // Document ID
          .get();

      if (doc.exists) {
        return MotorcycleLicenceRequirements33.fromFirestore(doc);
      }
    } catch (e) {
      print("Error fetching motorcycle licence requirements data: $e");
    }
    return null;
  }
}
