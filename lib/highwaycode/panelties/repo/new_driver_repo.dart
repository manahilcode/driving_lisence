import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/new_driver_model.dart';

class HighwayNewDriversRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayNewDriversModel> fetchHighwayNewDriversData() async {
    try {
      final docSnapshot = await _firestore
          .collection('highwaycode_Penalties')
          .doc('New drivers')
          .get();

      if (docSnapshot.exists) {
        return HighwayNewDriversModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
