import 'package:flutter/material.dart';

import '../model/hierarchy_of_road_users_model.dart';
import '../repo/hierarchy_of_road_users_repo.dart';

class HierarchyProvider extends ChangeNotifier {
  final HierarchyRepository _repository;
  HierarchyOfRoadUsers? _data;
  bool _isLoading = false;
  String? _errorMessage;

  HierarchyOfRoadUsers? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  HierarchyProvider(this._repository);

  // Fetch data from repository
  Future<void> fetchHierarchyData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository.fetchHierarchyData();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
