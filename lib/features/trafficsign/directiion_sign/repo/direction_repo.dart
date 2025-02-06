import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/direction_model.dart';

class SignRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SignData> fetchSignData() async {
    DocumentSnapshot doc =
        await _firestore.collection('sign_Introduction').doc('direction_sign').get();
    if (doc.exists) {
      return SignData.fromMap(doc.data() as Map<String, dynamic>);
    } else {
      throw Exception('Document does not exist');
    }
  }
}
