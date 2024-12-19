import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/reviewing_driving_model.dart';

class ReviewingYourDrivingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to fetch a single ReviewingYourDriving document by its ID
  Future<ReviewingYourDriving?> fetchReviewingYourDriving(String documentId) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('reviewingYourDriving').doc(documentId).get();
      if (snapshot.exists) {
        return ReviewingYourDriving.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Document not found');
      }
    } catch (e) {
      throw Exception('Failed to fetch document: $e');
    }
  }
}