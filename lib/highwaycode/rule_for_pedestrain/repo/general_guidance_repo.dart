import 'package:cloud_firestore/cloud_firestore.dart';

import '../../rule_for_motorcyclist/model/general_guidance_model.dart';
import '../model/general_guidance_model.dart';

class HighwayCodeWordOfRepo124 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCodeGeneralGuidance11> getHighwayCodeGeneralGuidance() async {
    try {
      DocumentSnapshot doc = await _firestore.collection("highwaycode_Rules_for_pedestrians").doc('General guidance').get();

      if (doc.exists) {
        return HighwayCodeGeneralGuidance11.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
