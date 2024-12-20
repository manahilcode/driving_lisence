import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/safetly_motorcycle.dart'; // import the model

class SafetyYourMotorcycleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch SafetyYourMotorcycle data from Firestore
  Future<SafetyYourMotorcycle> getSafetyYourMotorcycleData() async {
    try {
      // Fetch data from the Firestore collection 'safety_motorcycle' and document 'safety_motorcycle_data'
      DocumentSnapshot doc = await _firestore.collection('safety_motorcycle').doc('safety_motorcycle_data').get();

      if (doc.exists) {
        // Convert Firestore document data to SafetyYourMotorcycle model
        return SafetyYourMotorcycle.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data from Firebase: $e");
    }
  }
}
