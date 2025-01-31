import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/other_consequence_of_offending_model.dart';

class OtherConsequencesOfOffendingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<OtherConsequencesOfOffendingModel> fetchConsequencesData() async {
    try {
      final docSnapshot = await _firestore
          .collection('highwaycode_Penalties')
          .doc('Other consequences of offending')
          .get();

      if (docSnapshot.exists) {
        return OtherConsequencesOfOffendingModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
