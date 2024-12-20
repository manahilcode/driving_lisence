import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/animal_on_road_model.dart';

class AnimalsOnTheRoadRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AnimalsOnTheRoadModel> fetchAnimalsOnTheRoadData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return AnimalsOnTheRoadModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
