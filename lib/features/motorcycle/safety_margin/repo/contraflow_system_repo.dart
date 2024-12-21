import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/contraflow_system.dart';

class ContraflowSystemRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ContraflowSystem> getContraflowSystemData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('contraflow_system').doc('data').get();

      if (doc.exists) {
        return ContraflowSystem.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching Contraflow System data: $e");
    }
  }
}
