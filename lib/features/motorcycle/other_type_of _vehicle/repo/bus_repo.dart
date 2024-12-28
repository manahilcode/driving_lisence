import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/bus_model.dart'; // Update with the correct path

class BusAndTramInfoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<BusAndTramInfo> fetchBusAndTramInfo(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_Other_types_of_vehicle').doc(documentId).get();
      if (doc.exists) {
        return BusAndTramInfo.fromFirestore(doc);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
