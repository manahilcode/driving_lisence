import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/documents_model.dart';

class HighwayDocumentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayDocumentModel> fetchHighwayDocument() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Rules_for_motorcyclists")// Replace with your Firestore collection name
          .doc('Documents')  // Replace with actual document ID
          .get();

      if (docSnapshot.exists) {
        return HighwayDocumentModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
