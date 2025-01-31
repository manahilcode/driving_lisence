import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/fitness_to_drive_model.dart';

class FitnessToDriveRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FitnessToDriveModel> fetchFitnessToDriveData() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Rules_for_drivers_and_motorcyclists")
          .doc('Fitness to drive')
          .get();

      if (docSnapshot.exists) {
        return FitnessToDriveModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
