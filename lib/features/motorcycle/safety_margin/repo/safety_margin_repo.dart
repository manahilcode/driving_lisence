import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/safety_margin_model.dart';

class SafetyMarginRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SafetyMargin> getSafetyMarginData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('safety_margin').doc('data').get();

      if (doc.exists) {
        return SafetyMargin.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching Safety Margin data: $e");
    }
  }
}
