import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/tramways_model.dart';

class HighwaycodeTramwaysRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HighwaycodeTramwaysModel> fetchHighwaycodeTramwaysData() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Road_works_level_crossings_and_tramways")
          .doc('Tramways')
          .get();

      if (docSnapshot.exists) {
        return HighwaycodeTramwaysModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
