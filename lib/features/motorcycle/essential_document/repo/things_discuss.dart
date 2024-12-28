import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/things_discuss.dart';

class DriverInfoRepositoryDocument {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<ThingsDiscussDocument> fetchDriverInfo() async {
    try {
      DocumentSnapshot snapshot = await _firebaseFirestore.collection('motorcycle_Essential_documents').doc('Things_to_discuss_and_practise_with_your_trainer').get();

      if (snapshot.exists) {
        return ThingsDiscussDocument.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception("Data not found");
      }
    } catch (e) {
      rethrow;
    }
  }
}
