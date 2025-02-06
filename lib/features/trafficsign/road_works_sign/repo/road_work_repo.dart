// lib/repositories/road_work_sign_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/road_work_model.dart';

class RoadWorkSignRepository {
  final FirebaseFirestore firestore;

  RoadWorkSignRepository({required this.firestore});

  Future<RoadWorkSign> getRoadWorkSign() async {
    // Replace 'your_collection' and 'your_document' with your Firestore IDs.
    DocumentSnapshot doc = await firestore
        .collection('sign_Introduction')
        .doc('Road works signs')
        .get();

    if (!doc.exists) {
      throw Exception('Document does not exist');
    }
    return RoadWorkSign.fromMap(doc.data() as Map<String, dynamic>);
  }
}
