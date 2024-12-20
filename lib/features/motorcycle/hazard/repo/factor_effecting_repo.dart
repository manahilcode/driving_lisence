import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/factor_effecting.dart';

class FactorEffectingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetch a single FactorEffectingModel by document ID.
  Future<FactorEffectingModel?> fetchFactorEffecting(String collectionName, String docName) async {
    try {
      // Get the document from Firestore
      DocumentSnapshot docSnapshot = await _firestore.collection(collectionName).doc(docName).get();
      print('Fetching document from collection: $collectionName, ID: $docName');
      // Check if the document exists
      if (docSnapshot.exists) {
        // Map the document data to the FactorEffectingModel
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        return FactorEffectingModel.fromJson(data);
      } else {
        print('Document not found in collection $collectionName with id $docName.');
        return null;
      }
    } catch (e) {
      // Handle and log errors
      print('Error fetching FactorEffectingModel: $e');
      return null; // Return null or rethrow the exception
    }
  }




  /// Fetch all FactorEffectingModel documents from a collection.
  Future<List<FactorEffectingModel>> fetchAllFactors(String collectionName) async {
    try {
      // Get all documents in the specified collection
      QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();

      // Map each document to a FactorEffectingModel
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return FactorEffectingModel.fromJson(data);
      }).toList();
    } catch (e) {
      // Handle and log errors
      print('Error fetching all FactorEffectingModels: $e');
      return []; // Return an empty list in case of error
    }
  }
}
