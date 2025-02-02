// Provider Class
import 'package:flutter/cupertino.dart';

import '../model/overview_model.dart';
import '../repo/overview_repo.dart';

class OverviewControllerProvider extends ChangeNotifier {
  final OverviewRepository11 _repository;
  OverviewModel? _junction;
  bool _isLoading = false;
  String? _error;

  OverviewControllerProvider(this._repository);

  OverviewModel? get junction => _junction;
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