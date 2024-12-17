import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/looking_not_seeing.dart';

class LookingButNotSeeingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetch a single LookingButNotSeeingModel by document ID.
  Future<LookingButNotSeeingModel?> fetchLookingButNotSeeing(
      String collectionName, String docName) async {
    try {
      // Fetch the document from Firestore
      DocumentSnapshot docSnapshot =
      await _firestore.collection(collectionName).doc(docName).get();

      // Check if the document exists
      if (docSnapshot.exists) {
        // Map the document data to LookingButNotSeeingModel
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return LookingButNotSeeingModel.fromJson(data);
      } else {
        print('Document not found in collection $collectionName with id $docName.');
        return null;
      }
    } catch (e) {
      // Handle and log the error
      print('Error fetching LookingButNotSeeingModel: $e');
      return null; // Return null in case of an error
    }
  }

  /// Fetch all LookingButNotSeeingModel documents from a collection.
  Future<List<LookingButNotSeeingModel>> fetchAllLookingButNotSeeing(
      String collectionName) async {
    try {
      // Fetch all documents in the specified collection
      QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();

      // Map each document to a LookingButNotSeeingModel
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return LookingButNotSeeingModel.fromJson(data);
      }).toList();
    } catch (e) {
      // Handle and log the error
      print('Error fetching all LookingButNotSeeingModels: $e');
      return []; // Return an empty list in case of an error
    }
  }
}
