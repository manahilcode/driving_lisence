import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/overtaking_model.dart';

class HighwayOvertakingRepository1 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayOvertakingModel> fetchHighwayOvertakingData() async {
    try {
      final docSnapshot =
      await _firestore.collection('highwaycode_Motorways').doc('Overtaking').get();

      if (docSnapshot.exists) {
        return HighwayOvertakingModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
