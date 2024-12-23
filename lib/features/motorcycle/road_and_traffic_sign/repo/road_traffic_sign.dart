import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/road_trafic_sing.dart';

class RoadSignsRepositorySing {
  final FirebaseFirestore firestore;

  RoadSignsRepositorySing({required this.firestore});

  Future<RoadSignsDataSign> fetchRoadSignsData(String collection, String document) async {
    try {
      final docSnapshot = await firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        return RoadSignsDataSign.fromJson(data);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching data from Firestore: $e');
    }
  }
}
