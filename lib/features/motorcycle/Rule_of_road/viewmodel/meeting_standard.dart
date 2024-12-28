// ChangeNotifier class
import 'package:flutter/material.dart';

import '../model/meeting_standard_model.dart';
import '../repo/meeting_standard_repo.dart';

class MeetingStandardsNotifierRule extends ChangeNotifier {
  final MeetingStandardsRepository repository;
  MeetingStandardsRule? _data;
  bool _isLoading = false;
  String? _error;

  MeetingStandardsNotifierRule({required this.repository});

  MeetingStandardsRule? get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadMeetingStandards(String collection, String document) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _data = await repository.fetchMeetingStandards(collection, document);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}