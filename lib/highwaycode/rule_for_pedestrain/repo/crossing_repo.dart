import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/crossing_model.dart';

class HighwayCrossingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCrossing11?> fetchHighwayCrossing(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection("highwaycode_Rules_for_pedestrians").doc(documentId).get();
      if (doc.exists) {
        return HighwayCrossing11.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print('Error fetching highway crossing: $e');
      return null;
    }
  }
}
