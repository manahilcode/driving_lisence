import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/attitude_model.dart';

class AttitudeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AttitudeModel> fetchAttitudeData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return AttitudeModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
