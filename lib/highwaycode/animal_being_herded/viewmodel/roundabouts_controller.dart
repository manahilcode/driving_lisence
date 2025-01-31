// Provider Class
import 'package:flutter/cupertino.dart';

import '../model/roundabouts_model.dart';
import '../repo/roundabouts_repo.dart';

class JunctionTextProvider extends ChangeNotifier {
  final RoundaboutsRepository _repository;
  RoundaboutsModel? _junctionText;
  bool _isLoading = false;
  String? _error;

  JunctionTextProvider(this._repository);

  RoundaboutsModel? get junctionText => _junctionText;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadJunctionText(String documentId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _junctionText = await _repository.fetchJunctionText(documentId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
