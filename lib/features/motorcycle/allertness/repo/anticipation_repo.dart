import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/anticipation_model.dart';

class RoadAwarenessRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AnticipationModel> fetchRoadAwarenessData(String collection, String document) async {
    // log("called");
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();
         log(docSnapshot.id);

        final data = docSnapshot.data() as Map<String,dynamic>;
      log(data.toString());
         final model = AnticipationModel.fromFirestore(data);
          log(model.toString());
        return model;

    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}