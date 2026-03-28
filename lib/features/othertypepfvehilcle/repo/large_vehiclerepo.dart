import 'package:cloud_firestore/cloud_firestore.dart';

class largevehicleRepository {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('othertype_3');

  Future<Map<String, dynamic>?> fetchAlertData() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('othertype_3.3').get();
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



  Future<String?> fetchImage1() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('othertype_3.3').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return data['image1']; // Assuming 'image' field is stored in lower case
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching image: $e');
      return null;
    }
  }
  Future<String?> fetchImage2() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('othertype_3.3').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return data['image2']; // Assuming 'image' field is stored in lower case
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching image: $e');
      return null;
    }
  }
  Future<String?> fetchImage3() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('othertype_3.3').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return data['image3']; // Assuming 'image' field is stored in lower case
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching image: $e');
      return null;
    }
  }
}