import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/breakdown_model.dart';


class BreakdownPointsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<BreakdownPointModel> fetchBreakdownData() async {
    try {
      // Replace "collection_name" with the name of your Firestore collection
      // Replace "document_id" with the ID of the document containing the breakdown data
      DocumentSnapshot snapshot = await _firestore
          .collection("highwaycode_Breakdowns_and_incidents")
          .doc("Breakdowns")
          .get();

      if (snapshot.exists) {
        final data = snapshot.data();
        if (data != null) {
          final breakdownPointModel = BreakdownPointModel.fromJson(data as Map<String, dynamic>);
          return breakdownPointModel;
        }
      }
      throw Exception("No data found");
    } catch (e) {
      print("Error fetching breakdown data: $e");
      throw Exception("Failed to fetch breakdown data");
    }
  }
}