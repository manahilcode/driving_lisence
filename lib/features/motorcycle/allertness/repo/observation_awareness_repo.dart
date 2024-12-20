import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/observation_awarness_model.dart';

class ObservationAwarenessRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ObservationAwarenessData> fetchObservationAwarenessData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return ObservationAwarenessData.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
