import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/think_About.dart';

class ThinkAboutRepositoryLoading {
  final FirebaseFirestore _firestore;

  ThinkAboutRepositoryLoading(this._firestore);

  Future<ThinkAboutModelLoading> fetchThinkAbout(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_Motorcycle_loading').doc(documentId).get();
      if (doc.exists) {
        return ThinkAboutModelLoading.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
