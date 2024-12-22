import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/keep_control_motorcycle.dart';

class MotorcycleControlInfoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MotorcycleControlInfo?> fetchControlInfo(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return MotorcycleControlInfo.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching MotorcycleControlInfo: $e');
      return null;
    }
  }
}
