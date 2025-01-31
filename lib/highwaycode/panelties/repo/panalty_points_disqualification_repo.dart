import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/panalty_points_disqualification_model.dart';

class PenaltyPointsAndDisqualificationRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<PenaltyPointsAndDisqualificationModel> fetchPenaltyPointsData() async {
    try {
      final docSnapshot = await _firestore
          .collection('highwaycode_Penalties')
          .doc('Penalty points and disqualification')
          .get();

      if (docSnapshot.exists) {
        return PenaltyPointsAndDisqualificationModel.fromJson(
            docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
