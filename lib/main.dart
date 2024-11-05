import 'package:driving_lisence/features/allertness/viewmodel/controller.dart';
import 'package:driving_lisence/features/attitude/viewmodel/attitude_provider.dart';
import 'package:driving_lisence/features/choose_ride/choose_ride.dart';
import 'package:driving_lisence/features/essential_document/viewmodel/controller.dart';
import 'package:driving_lisence/features/motor_way_Driving/viewmodel/controller.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'features/Quiz/Incident_quiz/viewmodel/controller.dart';
import 'features/Quiz/Rule_of_the_road/viewmodel/controller.dart';
import 'features/Quiz/alertness_quiz/viewmodel/controller.dart';
import 'features/Quiz/attitude_quiz/viewmodel/controller.dart';
import 'features/Quiz/essential_document_quiz/viewmodel/controller.dart';
import 'features/Quiz/hazard_awareness_quiz/viewmodel/controller.dart';
import 'features/Quiz/motorway_driving_quiz/viewmodel/controller.dart';
import 'features/Quiz/other_type_vehicle_quiz/viewmodel/controller.dart';
import 'features/Quiz/road_traffic_sign_quiz/viewmodel/controller.dart';
import 'features/Quiz/safety_margin_quiz/viewmodel/controller.dart';
import 'features/Quiz/safety_vehicle_quiz/viewmodel/controller.dart';
import 'features/Quiz/vehicle_handling_quiz/viewmodel/controller.dart';
import 'features/Quiz/vehicle_loading_quiz/viewmodel/controller.dart';
import 'features/Quiz/vulnerable_road_user_quiz/viewmodel/controller.dart';
import 'features/incident/viewmodel/controller.dart';
import 'features/othertypepfvehilcle/viewmodel/Trams_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/bus_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/disabled_people_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/instructor_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/intro_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/large_vehicle_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/large_vehicle_provider2.dart';
import 'features/othertypepfvehilcle/viewmodel/meeting_the_standard_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/motercycle_provider.dart';
import 'features/othertypepfvehilcle/viewmodel/thinkaboutprovider.dart';
import 'features/road_and_traffic_sign/viewmodel/controller.dart';
import 'features/rule_of_road/viewmodel/controller.dart';
import 'features/vehicle_loading/viewmodel/controller.dart';
import 'features/vulnerable_road_user/viewmodel/controller.dart';

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
        ChangeNotifierProvider<VulnerableController>(
            create: (_) => VulnerableController()),
        ///////////////////////////////////////////
        ChangeNotifierProvider<BusProvider>(create: (_) => BusProvider()),
        ChangeNotifierProvider<disabledProvider>(
            create: (_) => disabledProvider()),
        ChangeNotifierProvider<instructorProvider>(
            create: (_) => instructorProvider()),
        ChangeNotifierProvider<OtherVehicleIntroProvider>(
            create: (_) => OtherVehicleIntroProvider()),
        ChangeNotifierProvider<LargeVehicleProvider>(
            create: (_) => LargeVehicleProvider()),
        ChangeNotifierProvider<largeVehicleProvider2>(
            create: (_) => largeVehicleProvider2()),
        ChangeNotifierProvider<meetingstandardProvider>(
            create: (_) => meetingstandardProvider()),
        ChangeNotifierProvider<OtherVehicleMotercycleProvider>(
            create: (_) => OtherVehicleMotercycleProvider()),
        ChangeNotifierProvider<ThinkaboutProvider>(
            create: (_) => ThinkaboutProvider()),
        ChangeNotifierProvider<TramsProvider>(create: (_) => TramsProvider()),
        ChangeNotifierProvider<Attitude>(create: (_) => Attitude()),
        ChangeNotifierProvider<AlertController>(
            create: (_) => AlertController()),
        ChangeNotifierProvider<QuizProvider>(create: (_) => QuizProvider()),
        ChangeNotifierProvider<AttitudeQuizProvider>(
            create: (_) => AttitudeQuizProvider()),
        ChangeNotifierProvider<SafetyVehicleQuizProvider>(
            create: (_) => SafetyVehicleQuizProvider()),
        ChangeNotifierProvider<SafetyMarginQuizProvider>(
            create: (_) => SafetyMarginQuizProvider()),
        ChangeNotifierProvider<HazardAwarenessQuizProvider>(
            create: (_) => HazardAwarenessQuizProvider()),
        ChangeNotifierProvider<VulnerableRoadUserQuizProvider>(
            create: (_) => VulnerableRoadUserQuizProvider()),
        ChangeNotifierProvider<OtherTypeVehicleProvider>(
            create: (_) => OtherTypeVehicleProvider()),
        ChangeNotifierProvider<VehicleHandlingQuizProvider>(
            create: (_) => VehicleHandlingQuizProvider()),
        ChangeNotifierProvider<MotoWayDrivingQuizProvider>(
            create: (_) => MotoWayDrivingQuizProvider()),
        ChangeNotifierProvider<RuleOfRoadQuizProvider>(
            create: (_) => RuleOfRoadQuizProvider()),
        ChangeNotifierProvider<VehicleLoadingQuizProvider>(
            create: (_) => VehicleLoadingQuizProvider()),
        ChangeNotifierProvider<IncidentQuizProvider>(
            create: (_) => IncidentQuizProvider()),
        ChangeNotifierProvider<EssentialDocumentQuizProvider>(
            create: (_) => EssentialDocumentQuizProvider()),
        ChangeNotifierProvider<RoadTrafficSignQuizProvider>(
            create: (_) => RoadTrafficSignQuizProvider()),

        //RoadTrafficSignQuizProvider
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: chooseride(),
      ),
    );
  }
}
