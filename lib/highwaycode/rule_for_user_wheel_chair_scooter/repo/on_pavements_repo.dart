import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/on_pavements_model.dart';

class OnPavementsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<OnPavements> getOnPavementsData() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection("highwaycode_Rules_for_users_wheelchairs_scooters")
          .doc('On pavements').get();

      if (doc.exists) {
        return OnPavements.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
