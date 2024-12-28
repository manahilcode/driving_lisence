import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/things_discuss.dart';

class TrainerPracticeRepository {
  final FirebaseFirestore _firestore;

  TrainerPracticeRepository(this._firestore);

  Future<TrainerPracticeModel> fetchTrainerPractice(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_Incidents_accidents_and_emergencies').doc(documentId).get();
      if (doc.exists) {
        return TrainerPracticeModel.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
