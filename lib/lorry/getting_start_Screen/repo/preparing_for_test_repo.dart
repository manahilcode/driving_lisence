import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/medical_requirement.dart';
import '../model/on_the_road.dart';
import '../model/other_study_aid.dart';
import '../model/preparing_for_test.dart';

class PreparingForTestRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'lorry_gettiing_Started'; // Replace with your collection name

  Future<PreparingForTest?> getInfo(String docId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collectionName).doc(docId).get();
      if (doc.exists) {
        return PreparingForTest.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }
}