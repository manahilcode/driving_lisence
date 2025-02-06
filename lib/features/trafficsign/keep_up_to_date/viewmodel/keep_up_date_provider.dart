// lib/providers/keep_up_to_date_provider.dart
import 'package:flutter/material.dart';

import '../model/keep_up_date_model.dart';
import '../repo/keep_up_date_repo.dart';

class KeepUpToDateProvider extends ChangeNotifier {
  final KeepUpToDateRepository repository;

  KeepUpToDateProvider({required this.repository});

  bool isLoading = false;
  KeepUpToDate? keepUpToDate;

  Future<void> fetchKeepUpToDate() async {
    isLoading = true;
    notifyListeners();

    try {
      keepUpToDate = await repository.getKeepUpToDate();
    } catch (e) {
      // Handle error appropriately in a real app.
      debugPrint('Error fetching data: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
