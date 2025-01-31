import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/about_theory_model.dart';

class GettingInfoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'lorry_gettiing_Started'; // Replace with your collection name

  Future<GettingInfo?> getInfo(String docId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collectionName).doc(docId).get();
      if (doc.exists) {
        return GettingInfo.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }
}
