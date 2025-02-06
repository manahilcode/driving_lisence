// lib/providers/sign_system_provider.dart
import 'package:flutter/material.dart';

import '../model/sign_system_model.dart';
import '../repo/sign_system_repo.dart';

class SignSystemProvider124 extends ChangeNotifier {
  final SignSystemRepository432 repository;

  SignSystemProvider124({required this.repository});

  bool isLoading = false;
  SignSystem321? signSystem;

  Future<void> fetchSignSystem() async {
    isLoading = true;
    notifyListeners();

    try {
      signSystem = await repository.getSignSystem();
    } catch (e) {
      // Handle errors as needed.
      debugPrint('Error fetching sign system: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
