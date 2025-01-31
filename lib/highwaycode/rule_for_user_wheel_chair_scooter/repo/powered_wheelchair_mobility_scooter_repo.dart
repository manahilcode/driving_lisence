import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/powered_wheelchair_mobility_scooter_model.dart';

class PoweredWheelchairsAndMobilityScootersRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<PoweredWheelchairsAndMobilityScooters> getPoweredWheelchairsData() async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection("highwaycode_Rules_for_users_wheelchairs_scooters")
          .doc('Powered wheelchairs and mobility scooters').get();

      if (doc.exists) {
        return PoweredWheelchairsAndMobilityScooters.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
