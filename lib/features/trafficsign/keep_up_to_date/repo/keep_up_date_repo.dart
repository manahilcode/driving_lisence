// lib/repositories/keep_up_to_date_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/keep_up_date_model.dart';

class KeepUpToDateRepository {
  final FirebaseFirestore firestore;

  KeepUpToDateRepository({required this.firestore});

  Future<KeepUpToDate> getKeepUpToDate() async {
    // Replace 'your_collection' and 'your_document' with your Firestore IDs.
    DocumentSnapshot doc = await firestore
        .collection('sign_Introduction')
        .doc('Keeping up to date')
        .get();

    if (!doc.exists) {
      throw Exception('Document does not exist');
    }
    return KeepUpToDate.fromMap(doc.data() as Map<String, dynamic>);
  }
}
