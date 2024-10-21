import 'package:driving_lisence/features/attitude/viewmodel/attitude_provider.dart';
import 'package:driving_lisence/features/choose_ride/choose_ride.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/Trams_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/bus_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/disabled_people_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/instructor_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/intro_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/large_vehicle_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/large_vehicle_provider2.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/meeting_the_standard_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/motercycle_provider.dart';
import 'package:driving_lisence/features/othertypepfvehilcle/model/thinkaboutprovider.dart';
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
              ChangeNotifierProvider(create: (context) => OtherVehicleIntroProvider()),
              ChangeNotifierProvider(create: (context) => OtherVehicleMotercycleProvider()),
              ChangeNotifierProvider(create: (context) =>LargeVehicleProvider()),
              ChangeNotifierProvider(create: (context) =>largeVehicleProvider2()),
              ChangeNotifierProvider(create: (context) =>BusProvider()),
              ChangeNotifierProvider(create: (context) =>TramsProvider()),
              ChangeNotifierProvider(create: (context) =>disabledProvider()),
              ChangeNotifierProvider(create: (context) =>meetingstandardProvider()),
              ChangeNotifierProvider(create: (context) =>ThinkaboutProvider()),
              ChangeNotifierProvider(create: (context) =>instructorProvider()),
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
