import 'package:flutter/material.dart';
import '../model/helping_other_road_model.dart';
import '../repo/helping_other_road_repo.dart';

class DazzleProvider extends ChangeNotifier {
  final HelpingOtherRoadRepo _repository = HelpingOtherRoadRepo();

  HelpingOtherRoadModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  HelpingOtherRoadModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchDazzleData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchDazzleData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
