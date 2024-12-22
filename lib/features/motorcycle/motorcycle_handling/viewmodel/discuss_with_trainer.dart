import 'package:flutter/material.dart';
import '../model/discuss_with_trainer.dart';
import '../repo/discuss_with_trainer.dart';

class TrainerDiscussionPracticeNotifier extends ChangeNotifier {
  TrainerDiscussionPracticeHandling? _data;
  bool _isLoading = false;

  TrainerDiscussionPracticeHandling? get data => _data;
  bool get isLoading => _isLoading;

  final TrainerDiscussionPracticeRepositoryHandling _repository = TrainerDiscussionPracticeRepositoryHandling();

  Future<void> loadTrainerDiscussionPractice(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _data = await _repository.fetchTrainerDiscussionPractice(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
