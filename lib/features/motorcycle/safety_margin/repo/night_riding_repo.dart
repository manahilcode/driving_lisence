import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/at_night_model.dart';

class NightRidingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<NightRiding> getNightRidingData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('night_riding').doc('data').get();

      if (doc.exists) {
        return NightRiding.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching Night Riding data: $e");
    }
  }
}
