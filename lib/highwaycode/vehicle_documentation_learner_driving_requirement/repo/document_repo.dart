import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/document_model.dart';

class HighwayCodeRepository1122 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCodeDocument1122> getDocuments() async {
    try {

      DocumentSnapshot snapshot = await _firestore
          .collection("highwaycodeMotor_vehicle_documentation_and_learner_driver_requirements")
          .doc("Documents")
          .get();
      return HighwayCodeDocument1122.fromJson(snapshot.data() as Map<String,dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
