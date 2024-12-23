import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/seential_document1.dart';

class EssentialDocumentsDetailsRepository {
  final FirebaseFirestore _firestore;

  EssentialDocumentsDetailsRepository(this._firestore);

  Future<EssentialDocumentsDetails> fetchEssentialDocumentsDetails(String collection, String document) async {
    try {
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        return EssentialDocumentsDetails.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document does not exist.");
      }
    } catch (e) {
      throw Exception("Failed to fetch Essential Documents Details: $e");
    }
  }
}
