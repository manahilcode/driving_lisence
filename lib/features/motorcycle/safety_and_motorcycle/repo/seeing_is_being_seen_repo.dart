import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/seeing_As_being_seen.dart';

class SeeingAndBeingSeenRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch Seeing and Being Seen data from Firestore
  Future<SeeingAndBeingSeen> getSeeingAndBeingSeenData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('seeing_and_being_seen').doc('data').get();

      if (doc.exists) {
        return SeeingAndBeingSeen.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data from Firebase: $e");
    }
  }
}
