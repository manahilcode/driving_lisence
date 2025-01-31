import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/learner_drivers_model.dart';

class HighwayLearnerDriverRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayLearnerDriver> getLearnerDriverDocuments() async {
    try {
      var doc = await _firestore
          .collection(
              'highwaycodeMotor_vehicle_documentation_and_learner_driver_requirements')
          .doc('Learner drivers')
          .get();
      return HighwayLearnerDriver.fromMap(doc.data() as Map<String, dynamic>);
    } catch (e) {
      rethrow; // rethrow to be caught by the provider
    }
  }
}
