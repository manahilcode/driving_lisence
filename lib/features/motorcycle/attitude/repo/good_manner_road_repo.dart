import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/good_manner_on_road_model.dart';

class GoodMannersRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<GoodMannersModel> fetchGoodMannersData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return GoodMannersModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
