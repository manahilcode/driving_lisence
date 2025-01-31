import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/control_the_vehicle_model.dart';

class ControlOfTheVehicleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection and document
  Future<ControlOfTheVehicle> fetchControlOfTheVehicleData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_General_rules_techniques_and_advice_for_all_drivers_and_riders") // Specify the collection name
          .doc('Control of the vehicle')                        // Specify the document ID
          .get();

      if (docSnapshot.exists) {
        return ControlOfTheVehicle.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
