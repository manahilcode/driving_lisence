import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/keep_your_motorcycle_stable.dart';

class MotorcycleStabilityRepository {
  final FirebaseFirestore _firestore;

  MotorcycleStabilityRepository(this._firestore);

  Future<MotorcycleStabilityModel> fetchMotorcycleStability(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_Motorcycle_loading').doc(documentId).get();
      if (doc.exists) {
        return MotorcycleStabilityModel.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
