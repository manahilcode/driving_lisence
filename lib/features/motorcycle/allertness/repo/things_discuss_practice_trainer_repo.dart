import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/things_discuss_practice_trainer.dart';

class ThingsToDiscussRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ThingsToDiscussModel> fetchThingsToDiscussData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return ThingsToDiscussModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
