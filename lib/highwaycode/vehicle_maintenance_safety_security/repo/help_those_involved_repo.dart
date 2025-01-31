import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/help_those_involved_model.dart';

class HighwayCodeHelpInvolvedRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCodeHelpInvolved> getHelpInvolvedDocument() async {
    try {
      var snapshot =
          await _firestore
              .collection("highwaycode_Vehicle_maintenance_safety_and_security")
              .doc('Help those involved').get();
      if (snapshot.exists) {
        return HighwayCodeHelpInvolved.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // Re-throws to be caught by the provider
    }
  }
}
