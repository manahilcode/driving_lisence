import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/additional_rule_high_speed_road_model.dart';

class AdditionalRulesHighSpeedRoadsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AdditionalRulesHighSpeedRoadsModel> fetchHighSpeedRoadRules() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Road_works_level_crossings_and_tramways")
          .doc('Additional rules for high-speed roads')
          .get();

      if (docSnapshot.exists) {
        return AdditionalRulesHighSpeedRoadsModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
