import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/periority_for_Bus.dart';

class CrossingInfoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<CrossingInfoModel> fetchCrossingInfo(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return CrossingInfoModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
