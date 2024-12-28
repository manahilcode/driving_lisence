import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/looking_after_motorcycle_model.dart'; // import the model

class MotorcycleMaintenanceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to fetch motorcycle maintenance data from Firestore
  Future<MotorcycleMaintenance> getMotorcycleMaintenanceData() async {
    try {
      // Fetch data from the 'motorcycle_maintenance' collection
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Safety_and_your_motorcycle').doc('Looking_after_your_motorcycle').get();

      if (doc.exists) {
        // Convert the document data into the MotorcycleMaintenance model
        return MotorcycleMaintenance.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data from Firebase: $e");
    }
  }
}
