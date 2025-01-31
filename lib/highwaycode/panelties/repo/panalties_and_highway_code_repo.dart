import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/panalties_and_highway_code_model.dart';

class PenaltiesAndHighwayCodeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<PenaltiesAndHighwayCodeModel> fetchPenaltiesData() async {
    try {
      final docSnapshot = await _firestore
          .collection('highwaycode_Penalties')
          .doc('Penalties and the Highway Code')
          .get();

      if (docSnapshot.exists) {
        return PenaltiesAndHighwayCodeModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
