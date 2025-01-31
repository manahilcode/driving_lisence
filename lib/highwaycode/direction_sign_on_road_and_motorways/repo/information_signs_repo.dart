import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/information_signs_model.dart';

class InformationSignRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<InformationSign?> fetchInformationSign(String documentId) async {
    try {
      final doc = await _firestore
          .collection("highwaycode_Direction_signs_on_roads_and_motorways")
          .doc(documentId)
          .get();
      if (doc.exists) {
        return InformationSign.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
