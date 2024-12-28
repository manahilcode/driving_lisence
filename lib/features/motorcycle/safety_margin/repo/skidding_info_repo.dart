import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/skidding_info_model.dart';

class SkiddingInfoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SkiddingInfo> getSkiddingInfoData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('motorcycle_ Safety_margins').doc('Skidding').get();

      if (doc.exists) {
        return SkiddingInfo.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document not found");
      }
    } catch (e) {
      throw Exception("Error fetching Skidding Info data: $e");
    }
  }
}
