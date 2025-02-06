// lib/repositories/sign_information_sign_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/information_sign_model.dart';

class SignInformationSignRepository {
  final FirebaseFirestore firestore;

  SignInformationSignRepository({required this.firestore});

  Future<SignInformationSign> getSignInformationSign() async {
    // Replace 'your_collection' and 'your_document' with your Firestore IDs.
    DocumentSnapshot doc = await firestore
        .collection('sign_Introduction')
        .doc('information_Sign')
        .get();

    if (!doc.exists) {
      throw Exception('Document does not exist');
    }
    return SignInformationSign.fromMap(doc.data() as Map<String, dynamic>);
  }
}
