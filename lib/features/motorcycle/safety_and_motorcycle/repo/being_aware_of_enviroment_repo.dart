import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/being_aware_of_enviroment_model.dart';

class BeingAwareOfTheEnvironmentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<BeingAwareOfTheEnvironmentModel> fetchData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();
      log(docSnapshot.exists.toString());
      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return BeingAwareOfTheEnvironmentModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
