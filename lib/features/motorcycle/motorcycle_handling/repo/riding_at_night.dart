import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/riding_at_night.dart';
import 'riding_at_night.dart';

class RidingAtNightRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<RidingAtNight?> fetchRidingAtNight(String collection, String document) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collection).doc(document).get();
      if (doc.exists) {
        return RidingAtNight.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error fetching RidingAtNight data: $e');
      return null;
    }
  }
}
