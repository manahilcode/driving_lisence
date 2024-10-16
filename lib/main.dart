import 'package:driving_lisence/features/attitude/viewmodel/attitude_provider.dart';
import 'package:driving_lisence/features/choose_ride/choose_ride.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

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
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<Attitude>(create: (_) => Attitude()),
            ],
            child: MaterialApp(
              home: chooseride(),
              debugShowCheckedModeBanner: false,
            ),
          );
        }

        // Otherwise, show a loading indicator while Firebase is initializing
        return const MaterialApp(
          home: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
