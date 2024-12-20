import 'package:flutter/material.dart';

import '../model/meeting_standard_model.dart';
import '../repo/meeting_standart_repo.dart';

class MeetingTheStandardsProvider extends ChangeNotifier {
  final MeetingTheStandardsRepository _repository = MeetingTheStandardsRepository();

  MeetingTheStandardsModel? _data;
  bool _isLoading = false;
  String? _errorMessage;

  MeetingTheStandardsModel? get data => _data;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchMeetingTheStandardsData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _data = await _repository.fetchMeetingTheStandardsData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
