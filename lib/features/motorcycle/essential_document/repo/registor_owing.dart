import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/registor_owing.dart';

class MotorcycleInfoRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<RegistorOwing> fetchMotorcycleInfo() async {
    try {
      DocumentSnapshot snapshot = await _firebaseFirestore.collection('motorcycleInfo').doc('your_doc_id').get();

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
