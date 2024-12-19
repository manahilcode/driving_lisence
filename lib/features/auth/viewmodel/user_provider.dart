// lib/providers/user_provider.dart
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../repo/user_repo.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final UserRepository _userRepository = UserRepository();

  UserModel? get user => _user;

  Future<void> fetchUserData(String uid) async {
    _user = await _userRepository.getUserData(uid);
    notifyListeners();
  }
}