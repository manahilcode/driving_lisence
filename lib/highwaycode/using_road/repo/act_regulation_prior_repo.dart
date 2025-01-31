import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/act_regulation_prior_model.dart';

class ActsAndRegulationsPriorTo1988Repo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ActsAndRegulationsPriorTo1988> getActsAndRegulationsData() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('highwaycode_Using_the_road')
          .doc('Acts and regulations prior to 1988').get();

      if (doc.exists) {
        return ActsAndRegulationsPriorTo1988.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
