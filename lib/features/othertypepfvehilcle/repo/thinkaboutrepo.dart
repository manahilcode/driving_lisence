import 'package:cloud_firestore/cloud_firestore.dart';

class thinkaboutRepository {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('othertype_8');

  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc(
          'othertype_8.8').get();
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