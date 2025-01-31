import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/be_prepared_model.dart';

class HighwayBePreparedRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayBePrepared> getBePreparedDocument() async {
    try {
      var snapshot = await _firestore
          .collection("highwaycode_Vehicle_maintenance_safety_and_security")
          .doc('Be prepared').get();
      if (snapshot.exists) {
        return HighwayBePrepared.fromMap(snapshot.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      rethrow; // rethrow to be caught by the provider
    }
  }
}
