import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../model/think_about_model.dart';

class SafetyMarginThinkAboutRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<SafetyMarginThinkAboutModel> fetchSafetyMarginData() async {
    try {
      // Assuming you have a 'safety_margin' collection with a document, e.g., 'safety_margin_data'
      DocumentSnapshot snapshot = await _firestore.collection('motorcycle_ Safety_margins').doc('Think_about').get();

      if (snapshot.exists) {
        return SafetyMarginThinkAboutModel.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}
