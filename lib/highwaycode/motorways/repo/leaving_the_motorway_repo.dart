import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/leaving_the_motorway_model.dart';

class LeavingMotorwayRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<LeavingMotorwayModel?> fetchLeavingMotorwayData(
      String collection, String document) async {
    try {
      final snapshot = await _firestore.collection(collection).doc(document).get();

      if (snapshot.exists && snapshot.data() != null) {
        return LeavingMotorwayModel.fromMap(snapshot.data()!);
      } else {
        print("Document not found or data is empty.");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }
}
