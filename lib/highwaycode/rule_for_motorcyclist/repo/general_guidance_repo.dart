import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/general_guidance_model.dart';

class HighwayCodeRepository11 {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Fetch data from Firestore (Assuming we have a "highway_code_general_guidance" collection)
  Future<HighwayCodeGeneralGuidance?> fetchGuidance() async {
    try {
     //"highwaycode_introduction","Wording of The Highway Code"
      DocumentSnapshot doc = await _firebaseFirestore
          .collection("highwaycode_Rules_for_motorcyclists")
          .doc('General guidance') // Use the correct document ID
          .get();

      if (doc.exists) {
        return HighwayCodeGeneralGuidance.fromFirestore(doc);
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
    return null;
  }
}
