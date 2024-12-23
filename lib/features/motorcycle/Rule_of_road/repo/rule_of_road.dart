// Repository Class
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/rule_of_road.dart';

class RulesOfTheRoadRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<RulesOfTheRoadModel> fetchRulesOfTheRoadData(String documentId) async {
    try {
      DocumentSnapshot snapshot =
      await _firestore.collection('yourCollection').doc(documentId).get();
      if (snapshot.exists) {
        return RulesOfTheRoadModel.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}