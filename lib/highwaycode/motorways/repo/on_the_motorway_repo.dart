import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/on_the_motorway_model.dart';

class HighwayMotorwayRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayMotorwayModel> fetchHighwayMotorwayData() async {
    try {
      final docSnapshot =
      await _firestore.collection('highwaycode_Motorways').doc('On the motorway').get();

      if (docSnapshot.exists) {
        return HighwayMotorwayModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
