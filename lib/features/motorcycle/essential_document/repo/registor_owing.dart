import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/registor_owing.dart';

class MotorcycleInfoRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<RegistorOwing> fetchMotorcycleInfo() async {
    try {
      DocumentSnapshot snapshot = await _firebaseFirestore.collection('motorcycle_Essential_documents').doc('Registering_and_owning_a_motorcycle_Continue').get();

      if (snapshot.exists) {
        return RegistorOwing.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Data not found");
      }
    } catch (e) {
      rethrow;
    }
  }
}
