import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../model/documentation_model.dart';

class DocumentationRepoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<DocumentationModelInfoModel> fetchCollisionInfo() async {
    try {
      // Assuming the collection name is 'collision_info' and the document ID is 'info_document'
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_Breakdowns_and_incidents")
          .doc('Documentation')
          .get();

      if (docSnapshot.exists) {
        // Convert the document data into the model
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return DocumentationModelInfoModel.fromMap(data);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      rethrow; // Handle errors by rethrowing them for UI handling
    }
  }

  // Save data method (optional, if needed)
  Future<void> saveCollisionInfo(
      DocumentationModelInfoModel collisionInfo) async {
    try {
      await _firestore
          .collection('collision_info')
          .doc('info_document')
          .set(collisionInfo.toMap());
    } catch (e) {
      rethrow;
    }
  }
}
