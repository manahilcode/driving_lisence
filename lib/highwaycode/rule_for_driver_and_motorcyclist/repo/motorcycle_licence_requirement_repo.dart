import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/motorcycle_licence_requirement_model.dart';

class MotorcycleLicenceRequirementsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MotorcycleLicenceRequirementsModel> fetchMotorcycleLicenceRequirements() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Rules_for_drivers_and_motorcyclists")  // Replace with your collection name
          .doc('Motorcycle licence requirements')  // Replace with actual document ID
          .get();

      if (docSnapshot.exists) {
        return MotorcycleLicenceRequirementsModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
