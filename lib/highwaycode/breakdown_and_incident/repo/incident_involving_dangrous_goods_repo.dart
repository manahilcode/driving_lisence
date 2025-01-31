import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/incident_involving_dangrous_goods_model.dart';

class IncidentInvolvingDangrousGoodsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<IncidentInvolvingDangrousGoodsModel> fetchIncidentAdvice() async {
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("highwaycode_Breakdowns_and_incidents")
          .doc('Incidents involving dangerous goods')  // The document ID
          .get();

      if (docSnapshot.exists) {
        return IncidentInvolvingDangrousGoodsModel.fromMap(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
