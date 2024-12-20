import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/carry_passenger_load_model.dart';

class CarryingPassengersAndLoadsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<CarryingPassengersAndLoadsModel> fetchData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return CarryingPassengersAndLoadsModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
