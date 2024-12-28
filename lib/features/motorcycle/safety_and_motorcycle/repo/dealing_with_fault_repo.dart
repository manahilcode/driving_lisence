import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/dealing_with_fault_model.dart';

class DealingWithFaultRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DealingWithFaultModel> fetchWheelBalancingInfo(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();
      log("Document Snapshot fetched: ${docSnapshot.exists}");
      log("Document Snapshot fetched: ${docSnapshot.id}");

      if (!docSnapshot.exists) {
        throw Exception("Document does not exist");
      }

      final data = docSnapshot.data() as Map<String, dynamic>;
      log("Data: $data");

      final model = DealingWithFaultModel.fromFirestore(data);
      log("Model created: ${model.title}");

      return model;
    } catch (e, stacktrace) {
      log("Error fetching data: $e", stackTrace: stacktrace);
      throw Exception("Failed to fetch data: $e");
    }
  }
}
