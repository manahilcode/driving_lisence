import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/motorcycle_loading.dart';

class MotorcycleLoadingRepository {
  final FirebaseFirestore _firestore;

  MotorcycleLoadingRepository(this._firestore);

  Future<MotorcycleLoadingModel> fetchMotorcycleLoading(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_loading').doc(documentId).get();
      if (doc.exists) {
        return MotorcycleLoadingModel.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
