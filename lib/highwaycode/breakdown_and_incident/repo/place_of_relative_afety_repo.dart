import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/place_of_relative_afety_model.dart';

class PlaceOfRelativeSafetyRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<PlaceOfRelativeSafety?> fetchPlaceOfRelativeSafety(String documentId) async {
    try {
      final doc = await _firestore.collection("highwaycode_Breakdowns_and_incidents").doc(documentId).get();
      if (doc.exists) {
        return PlaceOfRelativeSafety.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
