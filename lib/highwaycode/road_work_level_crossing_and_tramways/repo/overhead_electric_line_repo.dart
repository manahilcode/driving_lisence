import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/overhead_electric_line_model.dart';

class OverheadElectricLinesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<OverheadElectricLinesModel> fetchOverheadElectricLinesData() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Road_works_level_crossings_and_tramways")
          .doc('Overhead electric lines')
          .get();

      if (docSnapshot.exists) {
        return OverheadElectricLinesModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
