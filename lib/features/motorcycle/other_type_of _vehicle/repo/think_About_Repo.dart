import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_about.dart';

class ThinkAboutInfoRepositoryOthertype {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ThinkAboutInfoOtherType?> fetchThinkAboutInfo(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return ThinkAboutInfoOtherType.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching ThinkAboutInfo: $e');
      return null;
    }
  }
}
