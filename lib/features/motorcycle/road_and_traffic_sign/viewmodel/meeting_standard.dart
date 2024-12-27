import 'package:flutter/foundation.dart';

import '../model/meeting_standard.dart';
import '../repo/meeting_standard.dart';

class StandardsProviderRoadTraffic with ChangeNotifier {
  final StandardsRepositorySign repository;

  StandardsProviderRoadTraffic({required this.repository});

  MeetingStandardSign? _standardsData;
  MeetingStandardSign? get standardsData => _standardsData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadStandardsData(String collection, String document) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _standardsData = await repository.fetchStandardsData(collection, document);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
