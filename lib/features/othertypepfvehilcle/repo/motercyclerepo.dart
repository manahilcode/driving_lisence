import 'package:cloud_firestore/cloud_firestore.dart';

class motercycleRepository {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('othertype_2');

  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('other_type2.2').get();
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
      DocumentSnapshot docSnapshot = await collectionReference.doc('other_type2.2').get();
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
