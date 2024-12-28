import 'package:flutter/material.dart';

import '../model/things_discuss.dart';
import '../repo/things_discuss.dart';

class TrainerDiscussionNotifierLoading extends ChangeNotifier {
  final TrainerDiscussionRepositoryLoading repository;

  TrainerDiscussionModelLoading? _trainerDiscussion;
  bool _isLoading = false;
  String? _errorMessage;

  TrainerDiscussionModelLoading? get trainerDiscussion => _trainerDiscussion;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  TrainerDiscussionNotifierLoading({required this.repository});

  Future<void> loadTrainerDiscussion(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _trainerDiscussion = await repository.fetchTrainerDiscussion(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
