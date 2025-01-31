import 'package:flutter/material.dart';

import '../model/other_road_user_model.dart';
import '../repo/other_road_user_repo.dart';

class HighwayOtherRoadUsersProvider with ChangeNotifier {
  final HighwayOtherRoadUsersRepository _repository = HighwayOtherRoadUsersRepository();
  HighwayOtherRoadUsersModel? _highwayOtherRoadUsersData;
  bool _isLoading = false;
  String _errorMessage = '';

  HighwayOtherRoadUsersModel? get highwayOtherRoadUsersData => _highwayOtherRoadUsersData;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchHighwayOtherRoadUsersData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _highwayOtherRoadUsersData = await _repository.fetchHighwayOtherRoadUsersData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
