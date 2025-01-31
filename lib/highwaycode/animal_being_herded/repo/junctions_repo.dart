// Repository Class
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/junctions_model.dart';

class JunctionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Junction> getJunction(String documentId) async {
    try {
      final doc = await _firestore.collection('highwaycode_Animals_being_herded').doc(documentId).get();
      if (doc.exists) {
        return Junction.fromFirestore(doc);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching junction data: $e');
    }
  }
}