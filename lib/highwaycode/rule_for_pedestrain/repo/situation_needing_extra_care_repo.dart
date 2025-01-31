import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/situation_needing_extra_care_model.dart';

class SituationsNeedingExtraCareRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SituationsNeedingExtraCare> getSituationsNeedingExtraCare() async {
    try {
      DocumentSnapshot doc = await _firestore.collection("highwaycode_Rules_for_pedestrians").doc('Situations needing extra care').get();

      if (doc.exists) {
        return SituationsNeedingExtraCare.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
