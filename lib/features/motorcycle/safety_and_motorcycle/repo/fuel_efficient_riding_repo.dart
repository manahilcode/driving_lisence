import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/fuel_efficient_riding_model.dart';

class NoisePollutionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<NoisePollutionModel> fetchData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return NoisePollutionModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
