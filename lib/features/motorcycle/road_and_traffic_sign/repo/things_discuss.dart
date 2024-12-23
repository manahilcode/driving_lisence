// TrainerPractiseRepository
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/think_discuss.dart';

class TrainerPractiseRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<TrainerPractise?> fetchTrainerPractise(String collection, String document) async {
    try {
      DocumentSnapshot docSnapshot = await _firestore.collection(collection).doc(document).get();
      if (docSnapshot.exists) {
        return TrainerPractise.fromJson(docSnapshot.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching TrainerPractise: $e');
    }
    return null;
  }
}
