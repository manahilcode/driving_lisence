import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/self_driving_vehicle_model.dart';

class SelfDrivingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<SelfDrivingModel?> fetchSelfDrivingData(
      String collection, String document) async {
    try {
      final snapshot = await _firestore.collection(collection).doc(document).get();

      if (snapshot.exists) {
        return SelfDrivingModel.fromMap(snapshot.data() ?? {});
      } else {
        print("Document not found");
        return null;
      }
    } catch (e) {
      print('Error fetching self-driving data: $e');
      return null;
    }
  }
}
