import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/get_help_model.dart';

class HighwayGetHelpRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayGetHelp> getGetHelpDocument() async {
    try {
      var snapshot =
          await _firestore
              .collection("highwaycode_Vehicle_maintenance_safety_and_security")
              .doc('Get help').get();
      if (snapshot.exists) {
        return HighwayGetHelp.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // Re-throws to be caught by the provider
    }
  }
}
