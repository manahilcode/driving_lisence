import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/insurance.dart';

class InsuranceDetailsRepository {
  final FirebaseFirestore _firestore;

  InsuranceDetailsRepository(this._firestore);

  Future<InsuranceDetails> fetchInsuranceDetails(String collection, String document) async {
    try {
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        return InsuranceDetails.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document does not exist.");
      }
    } catch (e) {
      throw Exception("Failed to fetch Insurance Details: $e");
    }
  }
}
