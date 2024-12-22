import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/fog_info_model.dart';

class FogInfoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<FogInfo?> fetchFogInfo(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return FogInfo.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching FogInfo: $e');
      return null;
    }
  }
}
