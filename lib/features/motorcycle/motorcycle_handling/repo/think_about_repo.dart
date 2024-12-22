import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_about.dart';

class ThinkAboutRepositoryHandling {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ThinkAboutHandling?> fetchThinkAbout(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return ThinkAboutHandling.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching ThinkAbout data: $e');
      return null;
    }
  }
}
