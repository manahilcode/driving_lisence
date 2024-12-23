import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/question_model.dart';

class QuestionRepoMotorcycle {
  final FirebaseFirestore _firestore;

  QuestionRepoMotorcycle(this._firestore);

  Future<MotorcycleQuestionModel> fetchCrossingType(String documentId) async {
    try {
      final doc = await _firestore.collection('crossing_types').doc(documentId).get();
      if (doc.exists) {
        return MotorcycleQuestionModel.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
