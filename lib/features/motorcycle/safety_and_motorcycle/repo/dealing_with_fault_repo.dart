import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/dealing_with_fault_model.dart';

class DealingWithFaultRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DealingWithFaultModel> fetchWheelBalancingInfo(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return DealingWithFaultModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
