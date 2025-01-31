import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/incidents_model.dart';

class IncidentAdviceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<IncidentAdvice> fetchIncidentAdvice() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_Breakdowns_and_incidents")
          .doc('Incidents')
          .get();

      if (docSnapshot.exists) {
        return IncidentAdvice.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
