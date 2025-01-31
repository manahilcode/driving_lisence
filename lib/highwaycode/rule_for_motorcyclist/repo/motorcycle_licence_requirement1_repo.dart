import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/motorcycle_licence_requirement1_model.dart';

class MotorcycleLicenceRequirements22Repository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection for motorcycle licence requirements
  Future<MotorcycleLicenceRequirements22?> fetchMotorcycleLicenceRequirements22() async {
    try {
      DocumentSnapshot doc = await _firebaseFirestore
          .collection("highwaycode_Rules_for_motorcyclists")// Collection name
          .doc('Motorcycle licence requirements') // Document ID
          .get();

      if (doc.exists) {
        return MotorcycleLicenceRequirements22.fromFirestore(doc);
      }
    } catch (e) {
      print("Error fetching motorcycle licence requirements data: $e");
    }
    return null;
  }
}
