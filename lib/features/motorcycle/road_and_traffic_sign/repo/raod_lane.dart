import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/road_lane.dart';

class RoadLanesRepository {
  final FirebaseFirestore firestore;

  RoadLanesRepository({required this.firestore});

  Future<RoadLanesData> fetchRoadLanesData(String collection, String document) async {
    try {
      final docSnapshot = await firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        return RoadLanesData.fromJson(data);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching data from Firestore: $e');
    }
  }
}
