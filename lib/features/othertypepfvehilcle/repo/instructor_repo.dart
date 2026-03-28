import 'package:cloud_firestore/cloud_firestore.dart';

class instructorRepository {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('othertype_9');

  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc(
          'othertype_9.9').get();
      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching alert data: $e');
      return null;
    }
  }
}