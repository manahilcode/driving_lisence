import 'package:driving_lisence/features/attitude/viewmodel/attitude_provider.dart';
import 'package:driving_lisence/features/choose_ride/choose_ride.dart';
import 'package:driving_lisence/features/essential_document/viewmodel/controller.dart';
import 'package:driving_lisence/features/motor_way_Driving/viewmodel/controller.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'features/incident/viewmodel/controller.dart';
import 'features/road_and_traffic_sign/viewmodel/controller.dart';
import 'features/rule_of_road/viewmodel/controller.dart';
import 'features/vehicle_loading/viewmodel/controller.dart';

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
        ChangeNotifierProvider<IntroductionController>(
            create: (_) => IntroductionController()),
        ChangeNotifierProvider<Controller>(create: (_) => Controller()),
        ChangeNotifierProvider<RuleRoadController>(
            create: (_) => RuleRoadController()),
        ChangeNotifierProvider<RoadSignController>(
            create: (_) => RoadSignController()),
        ChangeNotifierProvider<EssentialDocumentsController>(
            create: (_) => EssentialDocumentsController()),
        ChangeNotifierProvider<IncidentController>(
            create: (_) => IncidentController()),
        ChangeNotifierProvider<VehicleLoadingProvider>(
            create: (_) => VehicleLoadingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: chooseride(),
      ),
    );
  }
}
