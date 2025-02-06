
// lib/repositories/traffic_sign_info_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/you_know_traffic_model.dart';

class TrafficSignInfoRepository {
  final FirebaseFirestore firestore;

  TrafficSignInfoRepository({required this.firestore});

  Future<TrafficSignInfo44> getTrafficSignInfo() async {
    // Replace 'your_collection' and 'your_document' with your Firestore IDs.
    DocumentSnapshot doc = await firestore
        .collection('sign_Introduction')
        .doc('Why know your traffic signs')
        .get();

    if (!doc.exists) {
      throw Exception('Document does not exist');
    }
    return TrafficSignInfo44.fromMap(doc.data() as Map<String, dynamic>);
  }
}
