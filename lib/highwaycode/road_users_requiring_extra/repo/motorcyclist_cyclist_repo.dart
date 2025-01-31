import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/motorcyclist_cyclist_model.dart';

class MotorcyclistsAndCyclistsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MotorcyclistsAndCyclistsModel> fetchMotorcyclistsAndCyclistsData() async {
    try {
      final docSnapshot = await _firestore.collection("highwaycode_Road_users_requiring_extra").doc('Motorcyclists and cyclists').get();

      if (docSnapshot.exists) {
        return MotorcyclistsAndCyclistsModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
