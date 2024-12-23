import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/motor_cycle_licence.dart';

class MotorcycleLicenceRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<MotorcycleLicence> fetchMotorcycleLicence() async {
    try {
      DocumentSnapshot snapshot = await _firebaseFirestore.collection('motorcycleLicence').doc('your_doc_id').get();

      if (snapshot.exists) {
        return MotorcycleLicence.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Data not found");
      }
    } catch (e) {
      rethrow;
    }
  }
}
