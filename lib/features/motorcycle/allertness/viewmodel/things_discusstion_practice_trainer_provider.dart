import 'package:flutter/material.dart';
import '../model/things_discuss_practice_trainer.dart';
import '../repo/things_discuss_practice_trainer_repo.dart';

class ThingsToDiscussProviderAllert extends ChangeNotifier {
  final ThingsToDiscussRepository _repository = ThingsToDiscussRepository();

  ThingsToDiscussModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  ThingsToDiscussModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchThingsToDiscussData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchThingsToDiscussData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
