// Provider Class
import 'package:flutter/cupertino.dart';

import '../model/junctions_model.dart';
import '../repo/junctions_repo.dart';

class JunctionProvider extends ChangeNotifier {
  final JunctionRepository _repository;
  Junction? _junction;
  bool _isLoading = false;
  String? _error;

  JunctionProvider(this._repository);

  Junction? get junction => _junction;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchJunction(String documentId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _junction = await _repository.getJunction(documentId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}