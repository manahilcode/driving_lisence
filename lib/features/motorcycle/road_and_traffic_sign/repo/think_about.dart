import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../incident/pages/think_about.dart';
import '../model/think_about.dart';
import 'think_about.dart';

class ThinkAboutRepository {
  final FirebaseFirestore _firestore;

  ThinkAboutRepository(this._firestore);

  Future<ThinkAboutSign> fetchThinkAbout(String collection, String document) async {
    try {
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collection).doc(document).get();

      if (docSnapshot.exists) {
        return ThinkAboutSign.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Document does not exist.");
      }
    } catch (e) {
      throw Exception("Failed to fetch Think About data: $e");
    }
  }
}
