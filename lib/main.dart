import 'package:driving_lisence/features/attitude/viewmodel/attitude_provider.dart';
import 'package:driving_lisence/features/choose_ride/choose_ride.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Attitude>(create: (_) => Attitude()),
        ChangeNotifierProvider<IntroductionController>(create:(_)=>IntroductionController() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: chooseride(),
      ),
    );
  }
}
