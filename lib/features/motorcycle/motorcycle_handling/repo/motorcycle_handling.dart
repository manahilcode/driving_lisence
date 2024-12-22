import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/motorcycle_handling.dart';
import 'motorcycle_handling.dart';

class MotorcycleHandlingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MotorcycleHandling?> fetchMotorcycleHandling(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return MotorcycleHandling.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching MotorcycleHandling data: $e');
      return null;
    }
  }
}
