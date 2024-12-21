import 'package:flutter/material.dart';
import '../model/think_About.dart';
import '../repo/think_about.dart'; // Replace with the correct path

class ThinkAboutProviderVal with ChangeNotifier {
   DiscussionQuestionsRepositoryVal? _repository;
   DiscussionQuestionsval? _data;
  bool _isLoading = false;
  String? _errorMessage;

   DiscussionQuestionsval? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

   ThinkAboutProviderVal(this._repository);

  // Fetch data from the repository
  Future<void> fetchDiscussionQuestionsData(String documentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await _repository?.fetchDiscussionQuestionsData(documentId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
