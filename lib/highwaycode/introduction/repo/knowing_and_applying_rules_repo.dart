import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/knowing_and_applying_rules_model.dart';

class RuleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<RuleModel?> fetchRuleData(String collection, String document) async {
    try {
      final snapshot = await _firestore.collection(collection).doc(document).get();

      if (snapshot.exists) {
        return RuleModel.fromMap(snapshot.data() ?? {});
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching rule data: $e');
      return null;
    }
  }
}
