import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/meeting_standard.dart';

class MotorcyclePassengerRepository {
  final FirebaseFirestore _firestore;

  MotorcyclePassengerRepository(this._firestore);

  Future<MeetingStandardModel11> fetchMotorcyclePassenger(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_passenger').doc(documentId).get();
      if (doc.exists) {
        return MeetingStandardModel11.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
