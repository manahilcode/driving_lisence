import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/security.dart';

class SecurityRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch Security data from Firestore
  Future<Security> getSecurityData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Safety_and_your_motorcycle').doc('Security').get();

      if (doc.exists) {
        return Security.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data from Firebase: $e");
    }
  }
}
