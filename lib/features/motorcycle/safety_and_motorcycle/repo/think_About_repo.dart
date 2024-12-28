import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_about.dart';

class MotorcycleSafetyThinkAboutRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch Think About data from Firestore
  Future<MotorcycleThinkAbout> MotorcycleGetThinkAboutData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Safety_and_your_motorcycle').doc('Think_about').get();

      if (doc.exists) {
        return MotorcycleThinkAbout.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data from Firebase: $e");
    }
  }
}
