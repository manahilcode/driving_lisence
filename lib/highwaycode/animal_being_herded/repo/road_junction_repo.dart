import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/road_junction_model.dart';


// Repository Class
class RoadJunctionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<RoadJunctionModel> fetchPoints(String documentId) async {
    try {
      final doc = await _firestore.collection('highwaycode_Animals_being_herded').doc(documentId).get();
      if (doc.exists) {
        return RoadJunctionModel.fromFirestore(doc);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching points data: $e');
    }
  }
}

