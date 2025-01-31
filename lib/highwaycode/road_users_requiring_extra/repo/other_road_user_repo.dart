import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/other_road_user_model.dart';

class HighwayOtherRoadUsersRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwayOtherRoadUsersModel> fetchHighwayOtherRoadUsersData() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Road_users_requiring_extra")
          .doc('Other road users')
          .get();

      if (docSnapshot.exists) {
        return HighwayOtherRoadUsersModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
