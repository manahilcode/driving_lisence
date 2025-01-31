
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/you_and_your_bicycle_model.dart';

class YouAndYourBicycleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<YouAndYourBicycle?> fetchData(String documentId) async {
    try {
      final doc = await _firestore.collection("highwaycode_Direction_signs_on_roads_and_motorways").doc(documentId).get();
      if (doc.exists) {
        return YouAndYourBicycle.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
