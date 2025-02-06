// lib/repositories/responsibility_for_traffic_signs_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/responsibilty_sign_model.dart';

class ResponsibilityForTrafficSignsRepository {
  final FirebaseFirestore firestore;

  ResponsibilityForTrafficSignsRepository({required this.firestore});

  Future<ResponsibilityForTrafficSigns> getResponsibilityForTrafficSigns() async {
    // Replace 'your_collection' and 'your_document' with your Firestore collection and document IDs.
    DocumentSnapshot doc = await firestore
        .collection('sign_Introduction')
        .doc('Responsibility for traffic signs')
        .get();

    if (!doc.exists) {
      throw Exception('Document does not exist');
    }
    return ResponsibilityForTrafficSigns.fromMap(doc.data() as Map<String, dynamic>);
  }
}
