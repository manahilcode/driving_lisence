import 'package:flutter/material.dart';
import '../model/obstructions_model.dart';
import '../repo/obstructions_repo.dart';

class ObstructionsNotifier extends ChangeNotifier {
  final ObstructionsRepository _repository = ObstructionsRepository();

  ObstructionsModel? _obstructions;
  ObstructionsModel? get obstructions => _obstructions;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Fetch all obstructions and notify listeners
  Future<void> fetchAllObstructions() async {
    _isLoading = true;
    notifyListeners();

    _obstructions = await _repository.getObstruction("Obstructions");

    _isLoading = false;
    notifyListeners();
  }

  // Add a new obstruction and notify listeners
  Future<void> addObstruction(ObstructionsModel obstruction) async {
    await _repository.addObstruction(obstruction);
    await fetchAllObstructions(); // Refresh the list
  }

  // Update an existing obstruction and notify listeners
  Future<void> updateObstruction(String documentId, ObstructionsModel obstruction) async {
    await _repository.updateObstruction(documentId, obstruction);
    await fetchAllObstructions(); // Refresh the list
  }

  // Delete an obstruction and notify listeners
  Future<void> deleteObstruction(String documentId) async {
    await _repository.deleteObstruction(documentId);
    await fetchAllObstructions(); // Refresh the list
  }
}