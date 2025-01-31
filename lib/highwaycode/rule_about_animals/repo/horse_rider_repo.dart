import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/horse_rider_model.dart';

class HighwayHorseRidersRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayHorseRidersModel> fetchHighwayHorseRidersData() async {
    try {
      final docSnapshot = await _firestore.collection("hightwaycode_Rules_about_animals").doc('Horse riders').get();

      if (docSnapshot.exists) {
        return HighwayHorseRidersModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
