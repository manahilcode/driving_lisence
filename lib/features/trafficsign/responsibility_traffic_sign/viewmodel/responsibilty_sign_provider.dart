// lib/providers/responsibility_for_traffic_signs_provider.dart
import 'package:flutter/material.dart';

import '../model/responsibilty_sign_model.dart';
import '../repo/responsibilty_sign_repo.dart';

class ResponsibilityForTrafficSignsProvider extends ChangeNotifier {
  final ResponsibilityForTrafficSignsRepository repository;

  ResponsibilityForTrafficSignsProvider({required this.repository});

  bool isLoading = false;
  ResponsibilityForTrafficSigns? data;

  Future<void> fetchResponsibilityForTrafficSigns() async {
    isLoading = true;
    notifyListeners();

    try {
      data = await repository.getResponsibilityForTrafficSigns();
    } catch (e) {
      // Handle the error as needed.
      debugPrint('Error fetching data: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
