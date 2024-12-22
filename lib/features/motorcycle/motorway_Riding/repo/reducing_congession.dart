import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/reducing_congestion.dart';

class TrafficManagementRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to get the data from Firestore
  Future<TrafficManagementModel> getTrafficManagementData() async {
    try {
      DocumentSnapshot doc = await _firestore.collection('traffic_management').doc('active_traffic').get();
      if (doc.exists) {
        return TrafficManagementModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("Data not found");
      }
    } catch (e) {
      throw Exception("Failed to load data: $e");
    }
  }
}
