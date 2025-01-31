import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/joining_the_motorway_model.dart';

class JoiningMotorwayRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<JoiningMotorwayModel?> fetchJoiningMotorwayData(String collection, String document) async {
    try {
      final snapshot = await _firestore.collection(collection).doc(document).get();

      if (snapshot.exists && snapshot.data() != null) {
        return JoiningMotorwayModel.fromMap(snapshot.data()!);
      } else {
        print("Document not found or no data available.");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }
}
