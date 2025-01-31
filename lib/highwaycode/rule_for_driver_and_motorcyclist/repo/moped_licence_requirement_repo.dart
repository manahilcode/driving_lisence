import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/moped_licence_requirement_model.dart';

class MopedLicenceRequirementsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MopedLicenceRequirementsModel> fetchMopedLicenceRequirements() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Rules_for_drivers_and_motorcyclists")
          .doc('Moped licence requirements')  // Replace with actual document ID
          .get();

      if (docSnapshot.exists) {
        return MopedLicenceRequirementsModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
