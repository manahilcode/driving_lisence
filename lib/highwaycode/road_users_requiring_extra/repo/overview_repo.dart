import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/overview_model.dart';

class HighwayCodeOverviewRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayCodeOverviewModel> fetchHighwayCodeOverviewData() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Road_users_requiring_extra")
          .doc('Overview')
          .get();

      if (docSnapshot.exists) {
        return HighwayCodeOverviewModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
