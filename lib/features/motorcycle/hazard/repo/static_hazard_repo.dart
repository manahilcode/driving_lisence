import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/hazard_models.dart';

class MotorcycleStaticHazardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch the data from the Firestore collection
  Future<MotorcycleStaticHazard?> fetchMotorcycleStaticHazard(String collectionName, String docName) async {
    try {
      // Fetching the document from the given collection and document name
      DocumentSnapshot docSnapshot = await _firestore.collection(collectionName).doc(docName).get();

      // Check if the document exists
      if (docSnapshot.exists) {
        // Extracting data from the document and creating a MotorcycleStaticHazard instance
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

        return MotorcycleStaticHazard.fromMap(data);
      } else {
        // Document not found, returning null or you can throw an error
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during the fetch operation
      print("Error fetching data: $e");
      return null; // You can also throw the error or return a default value
    }
  }
}
