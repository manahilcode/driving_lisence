import 'package:cloud_firestore/cloud_firestore.dart';

class AttitudeRepo
{



  // Method to fetch the 'tip' field from Firestore
  Future<Map<String,dynamic>?> fetchTip() async {
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('alert_1');
    try {
      DocumentSnapshot docSnapshot =
      await collectionReference.doc('alert_1.1').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return data; // Fetch the 'Tip' field
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching tip: $e');
      return null;
    }
  }


}