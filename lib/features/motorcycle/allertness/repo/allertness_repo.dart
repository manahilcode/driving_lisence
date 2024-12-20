import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/allertness_model.dart';

class AlertnessRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AlertnessData> fetchAlertnessData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return AlertnessData.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
