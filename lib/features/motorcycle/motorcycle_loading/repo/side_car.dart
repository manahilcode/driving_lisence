import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/side_car.dart';

class PillionPassengerRepository {
  final FirebaseFirestore _firestore;

  PillionPassengerRepository(this._firestore);

  Future<PillionPassengerModel> fetchPillionPassenger(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_Motorcycle_loading').doc(documentId).get();
      if (doc.exists) {
        return PillionPassengerModel.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
