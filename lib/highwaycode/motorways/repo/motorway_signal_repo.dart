import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/motorway_signal_model.dart';

class HighwayMotorwaySignalsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayMotorwaySignalsModel?> fetchHighwayMotorwaySignalsData(
      String collection, String document) async {
    try {
      final snapshot = await _firestore.collection(collection).doc(document).get();

      if (snapshot.exists && snapshot.data() != null) {
        return HighwayMotorwaySignalsModel.fromMap(snapshot.data()!);
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
