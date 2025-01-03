import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/break_system_model.dart';

class AntiLockBrakingSystemRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AntiLockBrakingSystem> getAntiLockBrakingSystemData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_ Safety_margins').doc('Anti-lock_braking_systems').get();

      if (doc.exists) {
        return AntiLockBrakingSystem.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching Anti-lock Braking System data: $e");
    }
  }
}
