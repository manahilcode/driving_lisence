// lib/providers/sign_warning_sign_provider.dart
import 'package:flutter/material.dart';

import '../model/warning_sign_model.dart';
import '../repo/warning_sign_repo.dart';

class SignWarningSignProvider extends ChangeNotifier {
  final SignWarningSignRepository repository;

  SignWarningSignProvider({required this.repository});

  bool isLoading = false;
  SignWarningSign221? signWarningSign;

  Future<void> fetchSignWarningSign() async {
    isLoading = true;
    notifyListeners();

    try {
      signWarningSign = await repository.getSignWarningSign();
    } catch (e) {
      debugPrint('Error fetching SignWarningSign data: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
