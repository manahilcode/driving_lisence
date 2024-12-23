import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_About.dart';

class ThinkAboutRepositoryDocument {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<ThinkAboutDocument> fetchTaxingMotorcycleInfo() async {
    try {
      DocumentSnapshot snapshot = await _firebaseFirestore.collection('taxingMotorcycleInfo').doc('your_doc_id').get();

      if (snapshot.exists) {
        return ThinkAboutDocument.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Data not found");
      }
    } catch (e) {
      rethrow;
    }
  }
}
