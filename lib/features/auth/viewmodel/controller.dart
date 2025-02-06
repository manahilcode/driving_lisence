import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../menu_screen.dart';
import '../repo/auth_repo.dart';
import '../../../../category.dart' as cat;

class AuthController extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  final List _storeUsrData = [];

  List get storeUserData => _storeUsrData;

  String _name = "";
  String get name => _name;


  void setName(value) {
    _name = value;
    notifyListeners();
  }

  void setUsrData(value) {
    _storeUsrData.add(value);
    if (kDebugMode) {
      print(_storeUsrData);
    }
  }

  Future<void> SignUpWithEmailAndPassword(
    context,
    String name,
    String email,
    String password,
  ) async {
    final auth = await _authRepository.signUpWithEmail(
        email: email, password: password, name: name, data: _storeUsrData);
    if (auth != null) {
      Route newRoute = MaterialPageRoute(builder: (context) => const MenuScreen());
      Navigator.pushAndRemoveUntil(
        context,
        newRoute,
        (Route<dynamic> route) => false, // Removes all previous routes
      );
    }
  }

  /// import sign in method from repo here
  Future<void> SignInWithEmailAndPassword(context, String email, String password) async {
    final auth = await _authRepository.signInWithEmail(email: email, password: password);
    if (auth != null) {
      Route newRoute = MaterialPageRoute(builder: (context) => const MenuScreen());
      Navigator.pushAndRemoveUntil(
        context,
        newRoute,
        (Route<dynamic> route) => false, // Removes all previous routes
      );
    }
  }

  /// sign in as a google
   Future<void> SignInWithGoogle(context) async
   {
     final sign = await _authRepository.signInWithGoogle();
     if(sign != null){
       Route newRoute = MaterialPageRoute(builder: (context) => const MenuScreen());
       Navigator.pushAndRemoveUntil(
         context,
         newRoute,
             (Route<dynamic> route) => false, // Removes all previous routes
       );
     }
   }

  // get user data
  Future<void> fetchAndDisplayUserProfile() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      // Await the result of the Future
      final data = await _authRepository.getUserData(uid!);

      // Now you can safely access the fields in the Map
      final userName = data?["name"];
      setName(userName);
      print("User Name: $userName");
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }

  /// sign out
  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
