import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/features/motorcycle/attitude/model/meeting_Standard_model.dart';

class StandardsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<StandardsModel> fetchStandardsData(String collection, String document) async {
    try {
      final docSnapshot = await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data()!;
        return StandardsModel.fromFirestore(data);
      } else {
        throw Exception("Document does not exist");
      }
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
