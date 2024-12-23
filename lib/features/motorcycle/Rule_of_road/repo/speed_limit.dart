// SpeedLimitsRepository
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/speed_limit.dart';

class SpeedLimitsRepository {
  final FirebaseFirestore firestore;

  SpeedLimitsRepository({required this.firestore});

  Future<SpeedLimitsModel> fetchSpeedLimits(String collection, String document) async {
    final docSnapshot = await firestore.collection(collection).doc(document).get();
    if (docSnapshot.exists) {
      return SpeedLimitsModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Document not found");
    }
  }
}