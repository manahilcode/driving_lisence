import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/seat_belts_and_child_restraints_model.dart';

class SeatBeltsAndChildRestraintsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SeatBeltsAndChildRestraintsModel> fetchSeatBeltsAndChildRestraints() async {
    try {
      final docSnapshot = await _firestore
          .collection("highwaycode_Rules_for_drivers_and_motorcyclists") // Replace with your collection name
          .doc('Seat belts and child restraints')  // Replace with actual document ID
          .get();

      if (docSnapshot.exists) {
        return SeatBeltsAndChildRestraintsModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
