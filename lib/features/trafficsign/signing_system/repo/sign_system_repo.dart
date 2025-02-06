// lib/repositories/sign_system_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/sign_system_model.dart';

class SignSystemRepository432{
  final FirebaseFirestore firestore;

  SignSystemRepository432({required this.firestore});

  Future<SignSystem321> getSignSystem() async {
    // Replace 'your_collection' and 'your_document' with your actual Firestore IDs.
    DocumentSnapshot doc = await firestore
        .collection('sign_Introduction')
        .doc('The signing system ')
        .get();

    if (!doc.exists) {
      throw Exception('Document does not exist');
    }

    return SignSystem321.fromMap(doc.data() as Map<String, dynamic>);
  }
}
