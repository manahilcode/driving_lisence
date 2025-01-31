
// Repository class for SignalCarriageway
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/signal_carriageway_model.dart';

class SignalCarriagewayRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from Firestore collection and document
  Future<SignalCarriageway> fetchSignalCarriagewayData(String documentId) async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_General_rules_techniques_and_advice_for_all_drivers_and_riders") // Firestore collection name
          .doc(documentId) // Firestore document ID
          .get();

      if (docSnapshot.exists) {
        return SignalCarriageway.fromFirestore(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}