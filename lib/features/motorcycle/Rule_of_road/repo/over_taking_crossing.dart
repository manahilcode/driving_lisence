// Repository Class
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/overtaking_crossing.dart';

class OvertakingCrossingsRepository {
  final FirebaseFirestore _firestore;

  OvertakingCrossingsRepository(this._firestore);

  Future<OvertakingCrossings> fetchOvertakingCrossings(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Rules_of_the_road').doc(documentId).get();

      if (doc.exists && doc.data() != null) {
        return OvertakingCrossings.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}