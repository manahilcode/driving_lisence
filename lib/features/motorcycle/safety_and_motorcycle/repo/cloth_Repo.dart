import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/cloth_model.dart';

class ClothRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch Cloth data from Firestore
  Future<Cloth> getClothData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('cloth').doc('data').get();

      if (doc.exists) {
        return Cloth.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data from Firebase: $e");
    }
  }
}
