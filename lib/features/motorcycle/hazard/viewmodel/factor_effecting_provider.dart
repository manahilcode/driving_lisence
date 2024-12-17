import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart'; // Import ChangeNotifier
import '../model/factor_effecting.dart';

class FactorEffectingProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<FactorEffectingModel> _factors = [];
  FactorEffectingModel? _factor;

  List<FactorEffectingModel> get factors => _factors;
  FactorEffectingModel? get factor => _factor;

  /// Fetch a single FactorEffectingModel by document ID.
  Future<void> fetchFactorEffecting(String collectionName, String docName) async {
    try {
      DocumentSnapshot docSnapshot = await _firestore.collection(collectionName).doc(docName).get();

      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        _factor = FactorEffectingModel.fromJson(data);
        notifyListeners(); // Notify listeners when data is fetched
      } else {
        print('Document not found in collection $collectionName with id $docName.');
        _factor = null;
        notifyListeners(); // Notify listeners if the document is not found
      }
    } catch (e) {
      print('Error fetching FactorEffectingModel: $e');
      _factor = null;
      notifyListeners(); // Notify listeners in case of error
    }
  }

  /// Fetch all FactorEffectingModel documents from a collection.
  Future<void> fetchAllFactors(String collectionName) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();

      _factors = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return FactorEffectingModel.fromJson(data);
      }).toList();

      notifyListeners(); // Notify listeners when data is fetched
    } catch (e) {
      print('Error fetching all FactorEffectingModels: $e');
      _factors = [];
      notifyListeners(); // Notify listeners in case of error
    }
  }
}
