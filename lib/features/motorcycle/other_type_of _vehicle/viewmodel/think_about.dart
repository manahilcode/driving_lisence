import 'package:flutter/material.dart';

import '../model/think_about.dart';
import '../repo/think_About_Repo.dart';

class ThinkAboutInfoNotifier extends ChangeNotifier {
  ThinkAboutInfoOtherType? _info;
  bool _isLoading = false;

  ThinkAboutInfoOtherType? get info => _info;
  bool get isLoading => _isLoading;

  final ThinkAboutInfoRepositoryOthertype _repository = ThinkAboutInfoRepositoryOthertype();

  Future<void> loadThinkAboutInfo(String collection, String document) async {
    _isLoading = true;
    notifyListeners();

    _info = await _repository.fetchThinkAboutInfo(collection, document);

    _isLoading = false;
    notifyListeners();
  }
}
