import 'package:flutter/material.dart';

import '../model/discusstion_with_trainer.dart';
import '../repo/discusstion_with_trainer_repo.dart';

class TrainerDiscussionProvider extends ChangeNotifier {
  final TrainerDiscussionRepository _repository = TrainerDiscussionRepository();

  TrainerDiscussionModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  TrainerDiscussionModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchTrainerDiscussionInfo(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchTrainerDiscussionInfo(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
