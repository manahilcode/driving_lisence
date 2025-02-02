// Repository Class
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/overview_model.dart';
import 'dart:developer' as log;

class OverviewRepository11 {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<OverviewModel> getJunction(String documentId) async {
    try {
      log.log("check");
      final doc = await _firestore.collection("highwaycode_Animals_being_herded").doc(documentId).get();
      log.log("check : ${doc.exists}");
      if (doc.exists) {
        return OverviewModel.fromFirestore(doc);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching junction data: $e');
    }
  }
}