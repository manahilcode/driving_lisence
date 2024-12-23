// Repository for fetching data from Firestore
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/signal_given_by_driver.dart';

class SignalInfoRepository {
  final FirebaseFirestore firestore;

  SignalInfoRepository({required this.firestore});

  Future<SignalInfo> fetchSignalInfo(String collection, String document) async {
    try {
      final docSnapshot = await firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        return SignalInfo.fromJson(data);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching data from Firestore: $e');
    }
  }
}
