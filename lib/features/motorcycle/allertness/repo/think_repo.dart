import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_about.dart';

class MotorcycleThinkAboutRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ThinkAboutModel> fetchThinkAboutData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return ThinkAboutModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
