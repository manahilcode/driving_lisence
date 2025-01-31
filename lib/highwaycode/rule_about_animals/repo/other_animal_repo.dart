import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/other_animal_model.dart';

class HighwayCodeOtherAnimalsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCodeOtherAnimalsModel> fetchHighwayCodeOtherAnimalsData() async {
    try {
      final docSnapshot = await _firestore.collection("hightwaycode_Rules_about_animals").doc('Other animals').get();

      if (docSnapshot.exists) {
        return HighwayCodeOtherAnimalsModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
