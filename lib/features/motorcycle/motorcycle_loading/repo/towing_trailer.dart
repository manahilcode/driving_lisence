import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/towing_trailer.dart';
import '../viewmodel/towing_trailer.dart';

class TowingTrailerRepository {
  final FirebaseFirestore _firestore;

  TowingTrailerRepository(this._firestore);

  Future<TowingTrailerModel> fetchTowingTrailer(String documentId) async {
    try {
      final doc = await _firestore.collection('motorcycle_Motorcycle_loading').doc(documentId).get();
      if (doc.exists) {
        return TowingTrailerModel.fromMap(doc.data()!);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
