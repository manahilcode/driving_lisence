import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/padestrian_model.dart';

class HighwayPedestriansRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayPedestriansModel> fetchHighwayPedestriansData() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Road_users_requiring_extra")
          .doc('Pedestrians')
          .get();

      if (docSnapshot.exists) {
        return HighwayPedestriansModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
