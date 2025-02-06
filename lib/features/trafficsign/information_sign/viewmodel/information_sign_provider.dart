// lib/providers/sign_information_sign_provider.dart
import 'package:flutter/material.dart';

import '../model/information_sign_model.dart';
import '../repo/information_sign_repo.dart';

class SignInformationSignProvider extends ChangeNotifier {
  final SignInformationSignRepository repository;

  SignInformationSignProvider({required this.repository});

  bool isLoading = false;
  List<Sign> signs = [];

  Future<void> fetchSignInformation() async {
    isLoading = true;
    notifyListeners();

    try {
      final signData = await repository.getSignInformationSign();
      signs = signData.signs;
    } catch (e) {
      // You could handle errors by setting an error message, etc.
      debugPrint('Error fetching sign information: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
