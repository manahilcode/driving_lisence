import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/discuss_with_trainer.dart';

class DiscussWithTrainerRuleRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DiscussWithTrainerRule> fetchSpeedLimitData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Rules_of_the_road').doc('Things_to_discuss_and_practise_with_your_trainer').get();

      if (doc.exists) {
        return DiscussWithTrainerRule.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
