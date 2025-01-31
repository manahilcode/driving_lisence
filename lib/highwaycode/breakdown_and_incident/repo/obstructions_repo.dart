import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/obstructions_model.dart';

class ObstructionsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Reference to the Firestore collection
  //.collection("highwaycode_Breakdowns_and_incidents")
  final String collectionPath = 'highwaycode_Breakdowns_and_incidents';

  // Fetch a single document by ID
  Future<ObstructionsModel?> getObstruction(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection(collectionPath).doc(documentId).get();
      if (doc.exists) {
        return ObstructionsModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching obstruction: $e");
      return null;
    }
  }

  // Fetch all documents in the collection
  Future<List<ObstructionsModel>> getAllObstructions() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(collectionPath).get();
      return querySnapshot.docs.map((doc) => ObstructionsModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print("Error fetching all obstructions: $e");
      return [];
    }
  }

  // Add a new document to the collection
  Future<void> addObstruction(ObstructionsModel obstruction) async {
    try {
      await _firestore.collection(collectionPath).add(obstruction.toMap());
    } catch (e) {
      print("Error adding obstruction: $e");
    }
  }

  // Update an existing document
  Future<void> updateObstruction(String documentId, ObstructionsModel obstruction) async {
    try {
      await _firestore.collection(collectionPath).doc(documentId).update(obstruction.toMap());
    } catch (e) {
      print("Error updating obstruction: $e");
    }
  }

  // Delete a document
  Future<void> deleteObstruction(String documentId) async {
    try {
      await _firestore.collection(collectionPath).doc(documentId).delete();
    } catch (e) {
      print("Error deleting obstruction: $e");
    }
  }
}