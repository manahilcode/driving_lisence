import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/essential_document.dart';

class EssentialDocumentsRepository {
  final FirebaseFirestore _firestore;

  EssentialDocumentsRepository(this._firestore);

  Future<EssentialDocumentsEss> fetchEssentialDocuments(String collection, String document) async {
    try {
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        return EssentialDocumentsEss.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document does not exist.");
      }
    } catch (e) {
      throw Exception("Failed to fetch Essential Documents: $e");
    }
  }
}
