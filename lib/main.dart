import 'package:driving_lisence/choose_ride.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Initialize Firebase asynchronously using a Future
  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Call the Firebase initialization method
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        // Check if initialization is done
        if (snapshot.connectionState == ConnectionState.done) {
          // Firebase is initialized, show the app
          return MaterialApp(
            home: chooseride(),
            debugShowCheckedModeBanner: false,
          );
        }

        // Otherwise, show a loading indicator while Firebase is initializing
        return MaterialApp(
          home: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
