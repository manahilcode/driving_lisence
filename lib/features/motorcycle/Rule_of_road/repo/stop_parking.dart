import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/stop_parking_model.dart';

class StoppingAndParkingRepository {
  final FirebaseFirestore firestore;

  StoppingAndParkingRepository({required this.firestore});

  Future<StoppingAndParkingModel> fetchStoppingAndParking(String collection, String document) async {
    final docSnapshot = await firestore.collection(collection).doc(document).get();
    if (docSnapshot.exists) {
      return StoppingAndParkingModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Document not found");
    }
  }
}