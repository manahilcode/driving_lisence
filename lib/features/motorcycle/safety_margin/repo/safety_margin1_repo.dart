import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/safety_margin1_model.dart';

class SafetyMargin1Repository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SafetyMargin1> getSafetyMargin1Data() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('safety_margin1').doc('data').get();

      if (doc.exists) {
        return SafetyMargin1.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching Safety Margin1 data: $e");
    }
  }
}
