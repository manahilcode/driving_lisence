// Repository Class
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/overview_model.dart';

class OverviewRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<OverviewModel> getJunction(String documentId) async {
    try {
      final doc = await _firestore.collection('highwaycode_Animals_being_herded').doc(documentId).get();
      if (doc.exists) {
        return OverviewModel.fromFirestore(doc);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching junction data: $e');
    }
  }
}