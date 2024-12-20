import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/giving_priority_other.dart';

class GivingPriorityToOthersRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<GivingPriorityToOthersModel> fetchGivingPriorityToOthersData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return GivingPriorityToOthersModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
