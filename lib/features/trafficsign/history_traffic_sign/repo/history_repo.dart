import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/history_sign_model.dart';

class TrafficSignRepository122 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<TrafficSignHistory> fetchTrafficSignHistory() async {
    DocumentSnapshot doc = await _firestore.collection('sign_Introduction').doc('A brief history of traffic signs ').get();
    if (doc.exists) {
      return TrafficSignHistory.fromMap(doc.data() as Map<String, dynamic>);
    } else {
      throw Exception('Document does not exist');
    }
  }
}