import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/avoiding_congession_model.dart';

class AvoidingCongestionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AvoidingCongestionModel> fetchData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return AvoidingCongestionModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
