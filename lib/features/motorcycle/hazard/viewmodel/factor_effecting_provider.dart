import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../model/factor_effecting.dart';
import '../repo/factor_effecting_repo.dart';

class FactorEffectingProvider with ChangeNotifier {
  final FactorEffectingRepository _repository = FactorEffectingRepository();

  List<FactorEffectingModel> _factors = [];
  FactorEffectingModel? _factor;

  List<FactorEffectingModel> get factors => _factors;
  FactorEffectingModel? get factor => _factor;

  /// Fetch a single FactorEffectingModel by document ID using the repository.
  Future<void> fetchFactorEffecting(String collectionName, String docName) async {
    try {
      _factor = await _repository.fetchFactorEffecting(collectionName, docName);
    } catch (e) {
      print('Error fetching FactorEffectingModel: $e');
      _factor = null;
    } finally {
      notifyListeners(); // Notify listeners when state changes
    }
  }

  Future<void> fetchSpecificDocument(String docId) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      String collectionName = 'motorcycle_seeing_hazard';

      DocumentSnapshot docSnapshot = await _firestore.collection(collectionName).doc(docId).get();

      if (docSnapshot.exists) {
        print('Document ID: $docId, Data: ${docSnapshot.data()}');
      } else {
        print('Document not found for ID: $docId');
      }
    } catch (e) {
      print('Error fetching document: $e');
    }
  }

  Future<void> fetchAllDocuments() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('motorcycle_seeing_hazard')
          .get();

      for (var doc in querySnapshot.docs) {
        print('Document ID: ${doc.id}, Data: ${doc.data()}');
      }
    } catch (e) {
      print('Error fetching all documents: $e');
    }
  }




  /// Fetch all FactorEffectingModel documents using the repository.
  Future<void> fetchAllFactors(String collectionName) async {
    try {
      _factors = await _repository.fetchAllFactors(collectionName);
    } catch (e) {
      print('Error fetching all FactorEffectingModels: $e');
      _factors = [];
    } finally {
      notifyListeners(); // Notify listeners when state changes
    }
  }
}
