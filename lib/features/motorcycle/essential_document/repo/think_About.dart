import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_About.dart';

class ThinkAboutRepositoryDocument {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<ThinkAboutDocument> fetchTaxingMotorcycleInfo() async {
    try {
      DocumentSnapshot snapshot = await _firebaseFirestore.collection('motorcycle_Essential_documents').doc('Think_about').get();

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
