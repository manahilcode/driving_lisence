import 'package:driving_lisence/highwaycode/breakdown_and_incident/repo/documentation_repo.dart';
import 'package:flutter/foundation.dart';
import '../model/documentation_model.dart';

class DocumentationProvider with ChangeNotifier {
  final DocumentationRepoRepository _repository = DocumentationRepoRepository();

  DocumentationModelInfoModel? _collisionInfo;
  bool _isLoading = false;
  String? _error;

  DocumentationModelInfoModel? get collisionInfo => _collisionInfo;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Method to fetch collision info
  Future<void> fetchCollisionInfo() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _collisionInfo = await _repository.fetchCollisionInfo();
      _isLoading = false;
    } catch (e) {
      _error = 'Failed to load collision information: ${e.toString()}';
      _isLoading = false;
    }

    notifyListeners();
  }

  // Optional method to save collision info
  Future<void> saveCollisionInfo(DocumentationModelInfoModel collisionInfo) async {
    try {
      await _repository.saveCollisionInfo(collisionInfo);
      _collisionInfo = collisionInfo;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to save collision information: ${e.toString()}';
      notifyListeners();
    }
  }
}
