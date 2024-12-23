import 'package:flutter/material.dart';

import '../model/helping_other_first_aid.dart';
import '../repo/helping_other_first_aid.dart';

class FirstAidProvider with ChangeNotifier {
  final FirstAidRepository _repository = FirstAidRepository();
  FirstAidData? firstAidData;
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadFirstAidData(String documentId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      firstAidData = await _repository.fetchFirstAidData(documentId);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
