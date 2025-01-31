
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/wording_of_highway_code_model.dart';

class HighwayCodeRepository1123{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch data from a specific collection and document
  Future<WordingOfHighwayCodeModel11?> fetchHighwayCodeData(
      String collection, String document) async {
    try {
      final snapshot = await _firestore.collection(collection).doc(document).get();

      if (snapshot.exists) {
        return WordingOfHighwayCodeModel11.fromMap(snapshot.data() ?? {});
      } else {
        print("Document not found");
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
