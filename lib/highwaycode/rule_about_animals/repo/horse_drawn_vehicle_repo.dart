import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/horse_drawn_vehicle_model.dart';

class HorseDrawnVehiclesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<HorseDrawnVehiclesModel> fetchHorseDrawnVehiclesData() async {
    try {
      final docSnapshot = await _firestore.collection("hightwaycode_Rules_about_animals").doc('Horse-drawn vehicles').get();

      if (docSnapshot.exists) {
        return HorseDrawnVehiclesModel.fromJson(docSnapshot.data()!);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
