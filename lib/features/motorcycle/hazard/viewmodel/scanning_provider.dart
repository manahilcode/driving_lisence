import 'package:flutter/foundation.dart';
import '../model/scanning_model.dart';
import '../repo/scanning_repo.dart';

class ScanningProvider with ChangeNotifier {
  final ScanningRepository _repository = ScanningRepository();

  // State to store the fetched scanning model
  ScanningModel? _scanningModel;
  List<ScanningModel> _scanningModels = [];

  // Getter for the single scanning model
  ScanningModel? get scanningModel => _scanningModel;

  // Getter for the list of scanning models
  List<ScanningModel> get scanningModels => _scanningModels;

  // Method to fetch a single scanning model from the repository
  Future<void> fetchScanningModel(String collectionName, String docId) async {
    try {
      _scanningModel = await _repository.fetchModel(collectionName, docId);
      notifyListeners(); // Notify listeners when data is fetched
    } catch (e) {
      print('Error in provider while fetching scanning model: $e');
    }
  }

  // Method to fetch all scanning models from the repository
  Future<void> fetchAllScanningModels(String collectionName) async {
    try {
      _scanningModels = await _repository.fetchAllModels(collectionName);
      notifyListeners(); // Notify listeners when data is fetched
    } catch (e) {
      print('Error in provider while fetching scanning models: $e');
    }
  }

  // Method to add a new scanning model
  Future<bool> addScanningModel(
      String collectionName, ScanningModel model) async {
    try {
      bool success = await _repository.addModel(collectionName, model);
      if (success) {
        _scanningModels.add(model); // Add the new model to the list
        notifyListeners(); // Notify listeners
      }
      return success;
    } catch (e) {
      print('Error in provider while adding scanning model: $e');
      return false;
    }
  }

  // Method to update an existing scanning model
  // Future<bool> updateScanningModel(
  //     String collectionName, String docId, ScanningModel model) async {
  //   try {
  //     bool success = await _repository.updateModel(collectionName, docId, model);
  //     if (success) {
  //       int index = _scanningModels.indexWhere((m) => m.id == docId);
  //       if (index != -1) {
  //         _scanningModels[index] = model; // Update the model in the list
  //         notifyListeners(); // Notify listeners
  //       }
  //     }
  //     return success;
  //   } catch (e) {
  //     print('Error in provider while updating scanning model: $e');
  //     return false;
  //   }
  // }

  // Method to delete a scanning model
  // Future<bool> deleteScanningModel(
  //     String collectionName, String docId) async {
  //   try {
  //     bool success = await _repository.deleteModel(collectionName, docId);
  //     if (success) {
  //       _scanningModels.removeWhere((m) => m.id == docId); // Remove from list
  //       notifyListeners(); // Notify listeners
  //     }
  //     return success;
  //   } catch (e) {
  //     print('Error in provider while deleting scanning model: $e');
  //     return false;
  //   }
  // }
}
