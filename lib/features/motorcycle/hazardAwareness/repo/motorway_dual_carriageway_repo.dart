import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/motorway_dual_carriageway.dart';

class MotorwaysAndDualCarriagewaysRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionPath = 'motorways_and_dual_carriageways';

  Future<MotorwaysAndDualCarriageways> fetchMotorwaysAndDualCarriageways() async {
    try {
      final snapshot = await _firestore.collection(collectionPath).doc().get();
      final data  = snapshot.data() as Map<String, dynamic>;
      final model =  MotorwaysAndDualCarriageways.fromFirestore(data);
      return model;
    } catch (e) {
      throw Exception('Error fetching motorways and dual carriageways: $e');
    }
  }
}
