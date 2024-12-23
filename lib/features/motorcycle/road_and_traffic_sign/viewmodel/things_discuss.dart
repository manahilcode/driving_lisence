import 'package:flutter/material.dart';

import '../model/think_discuss.dart';
import '../repo/things_discuss.dart';

class TrainerPractiseProvider extends ChangeNotifier {
  final TrainerPractiseRepository _repository;
  TrainerPractise? _trainerPractise;

  TrainerPractiseProvider(this._repository);

  TrainerPractise? get trainerPractise => _trainerPractise;

  Future<void> loadTrainerPractise(String collection, String document) async {
    _trainerPractise = await _repository.fetchTrainerPractise(collection, document);
    notifyListeners();
  }
}