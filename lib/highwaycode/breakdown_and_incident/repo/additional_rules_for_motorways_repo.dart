// Repository Class
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/additional_rules_for_motorways_model.dart';

class AdditionalRulesForMotorwaysRepository {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<AdditionalRulesForMotorwaysModel> fetchMotorwayGuide(String documentId) async {
try {
final doc = await _firestore.collection("highwaycode_Breakdowns_and_incidents").doc(documentId).get();
if (doc.exists) {
return AdditionalRulesForMotorwaysModel.fromFirestore(doc);
} else {
throw Exception('Document does not exist');
}
} catch (e) {
throw Exception('Error fetching motorway guide data: $e');
}
}
}