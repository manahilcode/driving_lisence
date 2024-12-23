import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/safety_in_tunnel.dart';

class TunnelSafetyRepository {
  final FirebaseFirestore _firestore;

  TunnelSafetyRepository(this._firestore);

  Future<TunnelSafetyModel> fetchTunnelSafety(String documentId) async {
    try {
      final doc = await _firestore.collection('tunnelSafety').doc(documentId).get();
      if (doc.exists) {
        return TunnelSafetyModel.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
