import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_about_model.dart';

class ThinkAboutRepositoryRiding {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch "Think About" data from Firestore
  Future<ThinkAboutModelRiding> getThinkAboutData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Motorway_riding').doc('Think_about').get();
      if (doc.exists) {
        return ThinkAboutModelRiding.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Think About data not found");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}
