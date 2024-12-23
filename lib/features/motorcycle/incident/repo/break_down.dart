import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/break_down.dart';

class BreakdownRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<BreakdownModel> fetchBreakdownData(String documentId) async {
    final snapshot = await _firestore
        .collection('motorcycle')
        .doc(documentId)
        .get();

    if (snapshot.exists) {
      return BreakdownModel.fromJson(snapshot.data()!);
    } else {
      throw Exception("Document not found");
    }
  }
}