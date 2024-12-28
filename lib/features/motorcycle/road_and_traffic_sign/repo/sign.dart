import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/sign.dart';

class SignSignRepository {
  Future<SignSign> fetchSignSignData(String documentId) async {
    try {
      // Assume Firebase Firestore is already set up in your project
      final doc = await FirebaseFirestore.instance
          .collection('motorcycle_Road_and_traffic_signs')
          .doc(documentId)
          .get();
      if (doc.exists) {
        return SignSign.fromJson(doc.data()!);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}