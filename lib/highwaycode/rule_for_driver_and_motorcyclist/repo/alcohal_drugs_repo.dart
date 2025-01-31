import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/alcohal_drugs_model.dart';

class HighwayCodeAlcoholDrugsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCodeAlcoholDrugsModel>
      fetchHighwayCodeAlcoholDrugsData() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Rules_for_drivers_and_motorcyclists")
          .doc('Alcohol and drugs')
          .get();

      if (docSnapshot.exists) {
        return HighwayCodeAlcoholDrugsModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
