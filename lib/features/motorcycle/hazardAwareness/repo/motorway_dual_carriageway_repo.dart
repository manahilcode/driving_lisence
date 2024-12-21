import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/motorway_dual_carriageway.dart';

class MotorwaysAndDualCarriagewaysRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'motorways_and_dual_carriageways';

  Future<List<MotorwaysAndDualCarriageways>> fetchMotorwaysAndDualCarriageways() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).get();
      return snapshot.docs.map((doc) {
        return MotorwaysAndDualCarriageways.fromFirestore(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error fetching motorways and dual carriageways: $e');
    }
  }
}
