import 'package:flutter/material.dart';

import '../model/things_discuss.dart';
import '../repo/things_discuss.dart';

class TrainerPracticeNotifier extends ChangeNotifier {
  final TrainerPracticeRepository repository;

  TrainerPracticeModel? _trainerPractice;
  bool _isLoading = false;
  String? _errorMessage;

  TrainerPracticeModel? get trainerPractice => _trainerPractice;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  TrainerPracticeNotifier({required this.repository});

  Future<void> loadTrainerPractice(String documentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _trainerPractice = await repository.fetchTrainerPractice(documentId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
