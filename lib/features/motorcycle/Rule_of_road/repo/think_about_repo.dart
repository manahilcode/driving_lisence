import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_about.dart';

class ThinkAboutRepoRule {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ThinkAboutRule> fetchSpeedLimitData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('speed_limits_with_subtitle').doc('data').get();

      if (doc.exists) {
        return ThinkAboutRule.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
