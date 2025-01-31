import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/overtaking_model.dart';

class HighwayOvertakingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore
  Future<HighwayOvertaking> fetchHighwayOvertakingData() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_General_rules_techniques_and_advice_for_all_drivers_and_riders")// Specify your Firestore collection
          .doc('Overtaking') // Specify the document ID
          .get();

      if (docSnapshot.exists) {
        return HighwayOvertaking.fromFirestore(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
