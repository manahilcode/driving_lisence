import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/riding_model.dart';

class HighwayCodeRidingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCodeRidingModel> fetchHighwayCodeRidingData() async {
    try {
      final docSnapshot = await _firestore.collection("hightwaycode_Rules_about_animals").doc('Riding').get();

      if (docSnapshot.exists) {
        return HighwayCodeRidingModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
