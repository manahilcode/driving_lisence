import 'package:cloud_firestore/cloud_firestore.dart';

class BusRepository {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('othertype_4');

  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('othertype_4.4').get();
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

  Future<String?> fetchImage() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('othertype_4.4').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return data['image']; // Assuming 'image' field is stored in lower case
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching image: $e');
      return null;
    }
  }
}
