import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/things_discuss.dart';

class DriverInfoRepositoryDocument {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<ThingsDiscussDocument> fetchDriverInfo() async {
    try {
      DocumentSnapshot snapshot = await _firebaseFirestore.collection('driverInfo').doc('your_doc_id').get();

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
