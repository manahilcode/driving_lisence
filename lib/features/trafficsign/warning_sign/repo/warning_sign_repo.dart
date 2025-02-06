// lib/repositories/sign_warning_sign_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/warning_sign_model.dart';

class SignWarningSignRepository {
  final FirebaseFirestore firestore;

  SignWarningSignRepository({required this.firestore});

  Future<SignWarningSign221> getSignWarningSign() async {
    // Replace 'your_collection' and 'your_document' with your Firestore collection and document IDs.
    DocumentSnapshot doc = await firestore
        .collection('sign_Introduction')
        .doc('Warning signs')
        .get();

    if (!doc.exists) {
      throw Exception('Document does not exist');
    }
    return SignWarningSign221.fromJson(doc.data() as Map<String, dynamic>);
  }
}
