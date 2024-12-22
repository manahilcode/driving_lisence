import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/motorcycle_info.dart';

class MotorcycleInfoRepository1{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MotorcycleInfo1?> fetchMotorcycleInfo(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return MotorcycleInfo1.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching motorcycle info: $e');
      return null;
    }
  }
}
