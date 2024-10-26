import 'package:cloud_firestore/cloud_firestore.dart';

class meetingstandardRepository {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('other_type7');

  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc(
          'othertype_7.7').get();
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