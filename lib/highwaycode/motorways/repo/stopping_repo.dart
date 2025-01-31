import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/stopping_model.dart';

class HighwayStoppingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayStoppingModel> fetchHighwayStoppingData() async {
    try {
      final docSnapshot = await _firestore.collection('highwaycode_Motorways').doc('Stopping').get();

      if (docSnapshot.exists) {
        return HighwayStoppingModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
