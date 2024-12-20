import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/avoid_tiredness_model.dart';

class AvoidingTirednessRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AvoidingTirednessModel> fetchAvoidingTirednessData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return AvoidingTirednessModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
