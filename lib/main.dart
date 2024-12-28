import 'package:driving_lisence/features/allertness/viewmodel/controller.dart';
import 'package:driving_lisence/features/attitude/viewmodel/attitude_provider.dart';
import 'package:driving_lisence/features/choose_ride/choose_ride.dart';
import 'package:driving_lisence/features/essential_document/viewmodel/controller.dart';
import 'package:driving_lisence/features/motor_way_Driving/viewmodel/controller.dart';
import 'package:driving_lisence/features/vehicle_handling/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'features/Quiz/Incident_quiz/viewmodel/controller.dart';
import 'features/Quiz/Rule_of_the_road/viewmodel/controller.dart';
import 'features/Quiz/alertness_quiz/viewmodel/controller.dart';
import 'features/Quiz/all_categories_quiz/viewmodel/controller.dart';
import 'features/Quiz/attitude_quiz/viewmodel/controller.dart';
import 'features/Quiz/essential_document_quiz/viewmodel/controller.dart';
import 'features/Quiz/hazard_awareness_quiz/viewmodel/controller.dart';
import 'features/Quiz/motorway_driving_quiz/viewmodel/controller.dart';
import 'features/Quiz/other_type_vehicle_quiz/viewmodel/controller.dart';
import 'features/Quiz/result/pages/result.dart';
import 'features/Quiz/result/viewmodel/resultController.dart';
import 'features/Quiz/road_traffic_sign_quiz/viewmodel/controller.dart';
import 'features/Quiz/safety_margin_quiz/viewmodel/controller.dart';
import 'features/Quiz/safety_vehicle_quiz/viewmodel/controller.dart';
import 'features/Quiz/vehicle_handling_quiz/viewmodel/controller.dart';
import 'features/Quiz/vehicle_loading_quiz/viewmodel/controller.dart';
import 'features/Quiz/vulnerable_road_user_quiz/viewmodel/controller.dart';
import 'features/auth/viewmodel/controller.dart';
import 'features/auth/viewmodel/user_provider.dart';
import 'features/incident/viewmodel/controller.dart';
import 'features/motorcycle/allertness/repo/allertness_repo.dart';
import 'features/motorcycle/allertness/repo/anticipation_repo.dart';
import 'features/motorcycle/allertness/repo/observation_awareness_repo.dart';
import 'features/motorcycle/allertness/viewmodel/alertness_provider.dart';
import 'features/motorcycle/allertness/viewmodel/anticipation_provider.dart';
import 'features/motorcycle/allertness/viewmodel/avoid_tiredness_provider.dart';
import 'features/motorcycle/allertness/viewmodel/being_seen_by_other_provider.dart';
import 'features/motorcycle/allertness/viewmodel/distraction_provider.dart';
import 'features/motorcycle/allertness/viewmodel/keep_warm_provider.dart';
import 'features/motorcycle/allertness/viewmodel/meeting_standard_provider.dart';
import 'features/motorcycle/allertness/viewmodel/observation_awareness_provider.dart';
import 'features/motorcycle/allertness/viewmodel/stay_focus_provider.dart';
import 'features/motorcycle/allertness/viewmodel/things_discusstion_practice_trainer_provider.dart';
import 'features/motorcycle/allertness/viewmodel/think_about_provider.dart';
import 'features/motorcycle/attitude/viewmodel/animal_on_road_provider.dart';
import 'features/motorcycle/attitude/viewmodel/attitude_provider.dart';
import 'features/motorcycle/attitude/viewmodel/discussion_with_trianer_provider.dart';
import 'features/motorcycle/attitude/viewmodel/following_safety_provider.dart';
import 'features/motorcycle/attitude/viewmodel/giving_priority_other_provider.dart';
import 'features/motorcycle/attitude/viewmodel/good_manner_on_road_provider.dart';
import 'features/motorcycle/attitude/viewmodel/helping_other_road_provider.dart';
import 'features/motorcycle/attitude/viewmodel/meeting_standard_repo.dart';
import 'features/motorcycle/attitude/viewmodel/pedestrain_crossing_provider.dart';
import 'features/motorcycle/attitude/viewmodel/priority_for_bus_provider.dart';
import 'features/motorcycle/attitude/viewmodel/think_about_provider.dart';
import 'features/motorcycle/hazard/viewmodel/clue_provider.dart';
import 'features/motorcycle/hazard/viewmodel/factor_effecting_provider.dart';
import 'features/motorcycle/hazard/viewmodel/hazard_provider.dart';
import 'features/motorcycle/hazard/viewmodel/learning_see_provider.dart';
import 'features/motorcycle/hazard/viewmodel/looking_seeing_provider.dart';
import 'features/motorcycle/hazard/viewmodel/road_weather_condition_provider.dart';
import 'features/motorcycle/hazard/viewmodel/scanning_provider.dart';
import 'features/motorcycle/hazard/viewmodel/seeing_hazard_provider.dart';
import 'features/motorcycle/hazard/viewmodel/static_hazard_provider.dart';
import 'features/motorcycle/hazard/viewmodel/understanding_hazard_provider.dart';
import 'features/motorcycle/hazard/viewmodel/what_if_provider.dart';
import 'features/motorcycle/hazard/viewmodel/your_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/repo/avoiding_congession_repo.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/avoid_congession_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/being_aware_of_enviroment_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/carry_passenger_load_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/cloth_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/dealing_with_fault_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/discuss_with_trainer_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/fuel_efficient_riding_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/looking_after_motorcycle_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/meeting_standard_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/parking_safetly_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/safetly_your_motorcycle_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/security_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/seeing_is_being_seen_provider.dart';
import 'features/motorcycle/safety_and_motorcycle/viewmodel/think_about.dart';
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
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<ResultController>(
            create: (_) => ResultController()),
        ChangeNotifierProvider<AllCategoriesQuizProvider>(
            create: (_) => AllCategoriesQuizProvider()),
        ChangeNotifierProvider<CluesProvider>(create: (_) => CluesProvider()),
        ChangeNotifierProvider<FactorEffectingProvider>(
            create: (_) => FactorEffectingProvider()),
        ChangeNotifierProvider<MotorcycleHazardProvider>(
            create: (_) => MotorcycleHazardProvider()),
        ChangeNotifierProvider<LearningSeeProvider>(
            create: (_) => LearningSeeProvider()),
        ChangeNotifierProvider<LookingButNotSeeingProvider>(
            create: (_) => LookingButNotSeeingProvider()),
        ChangeNotifierProvider<MotorcycleRoadWeatherConditionsProvider>(
            create: (_) => MotorcycleRoadWeatherConditionsProvider()),
        ChangeNotifierProvider<ScanningProvider>(
            create: (_) => ScanningProvider()),
        ChangeNotifierProvider<SeeingHazardProvider>(
            create: (_) => SeeingHazardProvider()),
        ChangeNotifierProvider<MotorcycleStaticHazardProvider>(
            create: (_) => MotorcycleStaticHazardProvider()),
        ChangeNotifierProvider<UnderstandingHazardsProvider>(
            create: (_) => UnderstandingHazardsProvider()),
        ChangeNotifierProvider<WhatIfProvider>(create: (_) => WhatIfProvider()),
        ChangeNotifierProvider<MotorcycleYourProvider>(
            create: (_) => MotorcycleYourProvider()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<FactorEffectingProvider>(
            create: (_) => FactorEffectingProvider()),
        //add
        ChangeNotifierProvider<AlertnessNotifier>(
            create: (_) => AlertnessNotifier(
                AlertnessRepository()
            )),
        // m allert
        ChangeNotifierProvider<AnticipationProvider>(create: (_) => AnticipationProvider(RoadAwarenessRepository())),
        ChangeNotifierProvider(create: (_) => AvoidingTirednessProvider()),
        ChangeNotifierProvider(create: (_) => BeingSeenProvider()),
        ChangeNotifierProvider(create: (_) => DistractionProvider()),
        ChangeNotifierProvider(create: (_) => KeepingWarmProvider()),
        ChangeNotifierProvider(create: (_) => MeetingTheStandardsProviderMotorcycleAllert()),
        ChangeNotifierProvider(create: (_) => ObservationAwarenessNotifier(ObservationAwarenessRepository())),
        ChangeNotifierProvider(create: (_) => StayFocusProvider()),
        ChangeNotifierProvider(create: (_) => ThingsToDiscussProviderAllert()),
        ChangeNotifierProvider(create: (_) => ThinkAboutProviderAllert()),

        // m attitude

        ChangeNotifierProvider(create: (_) => AnimalsOnTheRoadProviderAttitude()),
        ChangeNotifierProvider(create: (_) => AttitudeProviderAttitude()),
        ChangeNotifierProvider(create: (_) => TrainerDiscussionProviderAttitude()),
        ChangeNotifierProvider(create: (_) => FollowingSafelyProviderAttitude()),
        ChangeNotifierProvider(create: (_) => GivingPriorityToOthersProviderAttitude()),
        ChangeNotifierProvider(create: (_) => GoodMannersProviderAttitude()),
        ChangeNotifierProvider(create: (_) => DazzleProviderAttitude()),
        ChangeNotifierProvider(create: (_) => StandardsProviderAttitude()),
        ChangeNotifierProvider<CrossingProviderAttitudeMotorcycle>(create: (_) => CrossingProviderAttitudeMotorcycle()),
        ChangeNotifierProvider(create: (_) => CrossingInfoProviderAttitude()),
        ChangeNotifierProvider(create: (_) => ThinkAboutProviderAttitude()),

        // s safety
        ChangeNotifierProvider(create: (_) => AvoidingCongestionNotifier(AvoidingCongestionRepository())),
        ChangeNotifierProvider(create: (_) => BeingAwareOfTheEnvironmentProvider()),
        ChangeNotifierProvider(create: (_) => CarryingPassengersAndLoadsProvider()),
        ChangeNotifierProvider(create: (_) => ClothNotifier()),
        ChangeNotifierProvider(create: (_) => WheelBalancingProvider()),
        ChangeNotifierProvider(create: (_) => TrainerDiscussionNotifierSafety()),
        ChangeNotifierProvider(create: (_) => NoisePollutionProvider()),
        ChangeNotifierProvider(create: (_) => MotorcycleMaintenanceNotifier()),
        ChangeNotifierProvider(create: (_) => MotorcycleSafetyNotifierSafety()),
        ChangeNotifierProvider(create: (_) => ParkingSafelyNotifier()),
        ChangeNotifierProvider(create: (_) => SafetyYourMotorcycleNotifier()),
        ChangeNotifierProvider(create: (_) => SecurityNotifier()),
        ChangeNotifierProvider(create: (_) => SeeingAndBeingSeenNotifier()),
        ChangeNotifierProvider(create: (_) => ThinkAboutNotifierSafety()),

        //






      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ConnectivityWrapper(
            child: child ?? const SizedBox.shrink(),
          );
        },
        home: const chooseride(),
      ),
    );
  }
}

class ConnectivityWrapper extends StatelessWidget {
  final Widget child;

  const ConnectivityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          StreamBuilder<List<ConnectivityResult>>(
            // Changed to List<ConnectivityResult>
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              // Check if we have no data or if the connection is none
              final hasNoConnection = !snapshot.hasData ||
                  snapshot.data?.isEmpty == true ||
                  snapshot.data?.contains(ConnectivityResult.none) == true;

              if (hasNoConnection) {
                return Positioned.fill(
                  child: Container(
                    color: Colors.black87,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.wifi_off,
                          size: 50,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'No Internet Connection',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            final result =
                                await Connectivity().checkConnectivity();
                            if (result != ConnectivityResult.none) {
                              // Optional: Add any refresh logic here
                            }
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
