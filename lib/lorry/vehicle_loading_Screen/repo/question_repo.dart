import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/model.dart';

class LorryVehicleLooadingRepository {
  final FirebaseFirestore firestore;

  LorryVehicleLooadingRepository({required this.firestore});

  Future<List<LorryModel>> fetchLorryData() async {
    try {
      QuerySnapshot querySnapshot =
      await firestore.collection("lorry_VEHICLE LOADING_Quiz").get();

      return querySnapshot.docs.map((doc) {
        return LorryModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetching lorry data from Firestore: $e');
      return [];
    }
  }
}