import 'package:driving_lisence/features/Quiz/result/viewmodel/resultController.dart';
import 'package:driving_lisence/features/hazard/pages/hazard1.dart';
import 'package:driving_lisence/features/safety_margin/pages/safety_margin1.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/introduction.dart';
import 'package:flutter/material.dart';
import 'package:driving_lisence/practice_revision_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'features/Quiz/Incident_quiz/pages/incident_quiz.dart';
import 'features/Quiz/Rule_of_the_road/pages/rule_of_raod_quiz.dart';
import 'features/Quiz/alertness_quiz/pages/alertnessquiz.dart';
import 'features/Quiz/all_categories_quiz/pages/all_category.dart';
import 'features/Quiz/attitude_quiz/pages/attitude_quiz.dart';
import 'features/Quiz/essential_document_quiz/pages/essential_document_quiz.dart';
import 'features/Quiz/hazard_awareness_quiz/pages/hazard_awareness.dart';
import 'features/Quiz/motorway_driving_quiz/pages/motorway_handling.dart';
import 'features/Quiz/other_type_vehicle_quiz/pages/other_type_of_vehicle.dart';
import 'features/Quiz/road_traffic_sign_quiz/pages/road_traffic_sign_quiz.dart';
import 'features/Quiz/safety_margin_quiz/pages/safety_margin_quiz.dart';
import 'features/Quiz/safety_vehicle_quiz/pages/safetyVehicle.dart';
import 'features/Quiz/vehicle_handling_quiz/pages/vehicle_handling.dart';
import 'features/Quiz/vehicle_loading_quiz/pages/vehicle_loading_quiz.dart';
import 'features/Quiz/vulnerable_road_user_quiz/pages/vulnerable_road_user.dart';
import 'features/allertness/pages/introduction.dart';
import 'features/attitude/pages/attitude.dart';
import 'features/essential_document/pages/introduction.dart';
import 'features/incident/pages/incident_accident_and_emergency.dart';
import 'features/motor_way_Driving/pages/introduction.dart';
import 'features/motorcycle/Rule_of_road/pages/rule_of_road_screen.dart';
import 'features/motorcycle/attitude/pages/attitude_screen.dart';
import 'features/motorcycle/essential_document/pages/essentail_document_screen.dart';
import 'features/motorcycle/hazardAwareness/pages/hazard_awarness_screen.dart';
import 'features/motorcycle/incident/pages/incident_emergency.dart';
import 'features/motorcycle/motorcycle_handling/pages/motorcycle_handling_screen.dart';
import 'features/motorcycle/motorcycle_loading/pages/motorcycle_loading_screen.dart';
import 'features/motorcycle/motorway_Riding/pages/riding_on_motorcycle_screen.dart';
import 'features/motorcycle/other_type_of _vehicle/pages/other_type_vehicle_screen.dart';
import 'features/motorcycle/road_and_traffic_sign/pages/road_traffic_sign_screen.dart';
import 'features/motorcycle/safety_and_motorcycle/pages/safety_your_motorcycle_screen.dart';
import 'features/motorcycle/safety_margin/pages/safety_margin_screen.dart';
import 'features/motorcycle/vulnurable_road_user/pages/vulnerable_user_screen.dart';
import 'features/road_and_traffic_sign/pages/introduction.dart';
import 'features/rule_of_road/pages/introduction.dart';
import 'features/vehicle_handling/pages/introduction.dart';
import 'features/vehicle_loading/pages/introduction.dart';
import 'features/vehicle_safety/pages/vehicle_safety_1.dart';
import 'menu_screen.dart';
import 'package:flutter/foundation.dart';
import 'features/auth/viewmodel/user_provider.dart';
import 'features/motorcycle/allertness/pages/allertness.dart'; // Add this line

// ignore: must_be_immutable
class Category1 extends StatefulWidget {
  String? label;
  Category1({super.key, this.label});
  @override
  // ignore: library_private_types_in_public_api
  _Category1State createState() => _Category1State();
}

class _Category1State extends State<Category1>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<bool> _selectedCategories =
      List.generate(16, (_) => false); // 15 categories

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    //  _tabController = TabController(length: 1, vsync: this);

    if (kDebugMode) {
      print(widget.label ?? "");
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("category 1");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Category'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return MenuScreen(); // Replace with your actual screen widget
                }),
              );
            },
          ),
          // bottom: TabBar(
          //   controller: _tabController,
          //   tabs: const [
          //     Tab(text: 'Category',),
          //     // Tab(text: 'Progress'),
          //     // Tab(text: 'Selected'),
          //   ],
          //   labelColor: Colors.white,
          //   unselectedLabelColor: Colors.white70,
          //   indicatorColor: Colors.white,
          //   labelStyle: const TextStyle(fontWeight: FontWeight.bold,
          //     color: Colors.black
          //
          //   ),
          // ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      // Adding all category items here
                      //AllCategoriesQuizScreen
                      CategoryItem(
                          icon: Icons.list,
                          title: 'All categories',
                          progress: 0,
                          answered: 19,
                          correct: 6,
                          total: 774,
                          isSelected: _selectedCategories[0],
                          onTap: () => _toggleSelection(0),
                          categoryScreen: widget.label == "PracticeQuiz"
                              ? const AllCategoriesQuizScreen()
                              : const IntroductionAlertness()),
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.alertness;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        //   final category = data?["category"] ?? "";
                        // Calculate progress as a percentage of answered vs total
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }

                        return CategoryItem(
                            icon: Icons.notifications_none,
                            title: 'Alertness',
                            progress: progress.toInt(),
                            answered: 0,
                            correct: answered ?? 0,
                            total: total ?? 0,
                            isSelected: _selectedCategories[1],
                            onTap: () => _toggleSelection(1),
                            categoryScreen: MotorcycleAlertness());
                      }),
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.attitude;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        //  final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                          icon: Icons.drive_eta,
                          title: 'Attitude',
                          progress: progress.toInt() ?? 0,
                          answered: 0,
                          correct: answered ?? 0,
                          total: total ?? 0,
                          isSelected: _selectedCategories[2],
                          onTap: () => _toggleSelection(2),
                          categoryScreen: AttitudeScreenMotorcycle(),
                        );
                      }),
                      //       //
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.safetyVehicle;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }

                        return CategoryItem(
                          icon: Icons.speed,
                          title: 'Safety and your Motorcycle',
                          progress: progress.toInt() ?? 0,
                          answered: 0,
                          correct: answered ?? 0,
                          total: total ?? 0,
                          isSelected: _selectedCategories[3],
                          onTap: () => _toggleSelection(3),
                          categoryScreen: SafetyYourMotorcycleScreen(),
                        );
                      }),
                      //       //SafetyMarginQuizScreens
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.safetyMargin;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                            icon: Icons.traffic,
                            title: 'Safety margins',
                            progress: progress.toInt() ?? 0,
                            answered: 0,
                            correct: answered ?? 0,
                            total: total ?? 0,
                            isSelected: _selectedCategories[4],
                            onTap: () => _toggleSelection(4),
                            categoryScreen: SafetyMarginScreen());
                      }),
                      //       //HazardAwarenessQuizScreens
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.hazardAwareness;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                            icon: Icons.visibility,
                            title: 'Hazard awareness',
                            progress: progress.toInt() ?? 0,
                            answered: 0,
                            correct: answered ?? 0,
                            total: total ?? 0,
                            isSelected: _selectedCategories[5],
                            onTap: () => _toggleSelection(5),
                            categoryScreen: HazardAwarnessScreen());
                      }),
                      //       //SafetyMarginQuizScreens
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.vulnerableRoadUser;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                          icon: Icons.local_hospital,
                          title: 'Vulnerable road users',
                          progress: progress.toInt() ?? 0,
                          answered: 0,
                          correct: answered ?? 0,
                          total: total ?? 0,
                          isSelected: _selectedCategories[6],
                          onTap: () => _toggleSelection(6),
                          categoryScreen: VulnerableUserScreen(),
                        );
                      }),
                      //       //OtherTypeVehicleQuizScreen
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.otherTypeVehicle;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                            icon: Icons.navigation,
                            title: 'Other types of vehicle',
                            progress: progress.toInt() ?? 0,
                            answered: 0,
                            correct: answered ?? 0,
                            total: total ?? 0,
                            isSelected: _selectedCategories[7],
                            onTap: () => _toggleSelection(7),
                            categoryScreen: OtherTypeVehicleScreen());
                      }),
                      //       //MotowayDriverQuizScreens
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.motorWayDriving;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                          icon: Icons.car_crash_outlined,
                          title: 'Motorway driving',
                          progress: progress.toInt() ?? 0,
                          answered: 0,
                          correct: answered ?? 0,
                          total: total ?? 0,
                          isSelected: _selectedCategories[8],
                          onTap: () => _toggleSelection(8),
                          categoryScreen: RidingOnMotorcycleScreen(),
                        );
                      }),
                      //       //VehicleHandlingQuizProvider
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.vehicleHandling;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                          icon: Icons.car_crash_outlined,
                          title: 'Motorcycle handling',
                          progress: progress.toInt() ?? 0,
                          answered: 0,
                          correct: answered ?? 0,
                          total: total ?? 0,
                          isSelected: _selectedCategories[9],
                          onTap: () => _toggleSelection(9),
                          categoryScreen: MotorcycleHandlingScreen(),
                        );
                      }),
                      //       //RuleOfRoadQuizScreens
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.ruleOfRoad;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                          icon: Icons.lightbulb_outline,
                          title: 'Rules of the road',
                          progress: progress.toInt() ?? 0,
                          answered: 0,
                          correct: answered ?? 0,
                          total: total ?? 0,
                          isSelected: _selectedCategories[10],
                          onTap: () => _toggleSelection(10),
                          categoryScreen: MotorcycleRuleOfRoadScreen(),
                        );
                      }),
                      //       //RoadTrafficSignQuizScreens
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.roadTrafficSign;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                          icon: Icons.local_police,
                          title: 'Road and traffic signs',
                          progress: progress.toInt() ?? 0,
                          answered: 0,
                          correct: answered ?? 0,
                          total: total ?? 0,
                          isSelected: _selectedCategories[11],
                          onTap: () => _toggleSelection(11),
                          categoryScreen: RoadTrafficSignScreen(),
                        );
                      }),
                      //       //EssentialDocumentQuizScreens
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.essentialDocument;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                          icon: Icons.build,
                          title: 'Essential documents',
                          progress: progress.toInt() ?? 0,
                          answered: 0,
                          correct: answered ?? 0,
                          total: total ?? 0,
                          isSelected: _selectedCategories[12],
                          onTap: () => _toggleSelection(12),
                          categoryScreen: EssentailDocumentScreen(),
                        );
                      }),
                      //       //IncidentQuizScreens
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.incident;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                            icon: Icons.warning_amber_rounded,
                            title: 'Incidents, accidents, and emergencies',
                            progress: progress.toInt() ?? 0,
                            answered: 0,
                            correct: answered ?? 0,
                            total: total ?? 0,
                            isSelected: _selectedCategories[13],
                            onTap: () => _toggleSelection(13),
                            categoryScreen: IncidentEmergencyScreen());
                      }),
                      //       //VehicleLoadingQuizScreens
                      Consumer<ResultController>(
                          builder: (context, value, child) {
                        final data = value.vehicleLoading;
                        final answered =
                            int.tryParse(data?["correctQuestion"] ?? "");
                        final total =
                            int.tryParse(data?["totalQuestion"] ?? "");
                        final category = data?["category"] ?? "";
                        double progress = 0.0;

                        if (answered != null && total != null && total > 0) {
                          progress = (answered / total) * 100;
                        }
                        return CategoryItem(
                          icon: Icons.warning_amber_rounded,
                          title: 'Vehicle Loading',
                          progress: progress.toInt() ?? 0,
                          answered: 0,
                          correct: answered ?? 0,
                          total: total ?? 0,
                          isSelected: _selectedCategories[14],
                          onTap: () => _toggleSelection(14),
                          categoryScreen: widget.label == "PracticeQuiz"
                              ? const VehicleLoadingQuizScreens()
                              : const IntroductionVehicleLoading(),
                        );
                      }),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(16.0),
                      //   child: Text(
                      //     'Select one or more categories to revise',
                      //     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      _getCategoryScreen(selectedIndex)),
                            );
                          },
                          child: const Text('CONTINUE',
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }

  void _toggleSelection(int index) {
    setState(() {
      // Deselect all categories first
      for (int i = 0; i < _selectedCategories.length; i++) {
        _selectedCategories[i] = false;
      }

      // Then select the clicked category
      _selectedCategories[index] = true;

      // Update selectedIndex
      selectedIndex = index;
    });
  }

  Widget _getCategoryScreen(int index) {
    switch (index) {
      case 0:
        return widget.label == "PracticeQuiz"
            ? const AllCategoriesQuizScreen()
            : PracticeRevisionDialog();
      case 1:
        return widget.label == "PracticeQuiz"
            ? const QuizScreen()
            : const MotorcycleAlertness();
      case 2:
        return widget.label == "PracticeQuiz"
            ? const AttitudeQuizScreens()
            : const AttitudeScreenMotorcycle();
      case 3:
        return widget.label == "PracticeQuiz"
            ? const SafetyVehicleQuizScreens()
            : SafetyYourMotorcycleScreen();
      case 4:
        return widget.label == "PracticeQuiz"
            ? const SafetyMarginQuizScreens()
            : SafetyMarginScreen();
      case 5:
        return widget.label == "PracticeQuiz"
            ? const HazardAwarenessQuizScreens()
            : HazardAwarnessScreen();
      case 6:
        return widget.label == "PracticeQuiz"
            ? const VulnerableRoadUserQuizScreens()
            : const VulnerableUserScreen();
      case 7:
        return widget.label == "PracticeQuiz"
            ? const OtherTypeVehicleQuizScreen()
            : OtherTypeVehicleScreen();
      case 8:
        return widget.label == "PracticeQuiz"
            ? const MotowayDriverQuizScreens()
            : const RidingOnMotorcycleScreen();
      case 9:
        return widget.label == "PracticeQuiz"
            ? const VehicleHandlingQuizScreens()
            : const MotorcycleHandlingScreen();
      case 10:
        return widget.label == "PracticeQuiz"
            ? const RuleOfRoadQuizScreens()
            : const MotorcycleRuleOfRoadScreen();
      case 11:
        return widget.label == "PracticeQuiz"
            ? const RoadTrafficSignQuizScreens()
            : const RoadTrafficSignScreen();
      case 12:
        return widget.label == "PracticeQuiz"
            ? const EssentialDocumentQuizScreens()
            : const EssentailDocumentScreen();
      case 13:
        return widget.label == "PracticeQuiz"
            ? const IncidentQuizScreens()
            : const IncidentEmergencyScreen();
      case 14:
        return widget.label == "PracticeQuiz"
            ? const VehicleLoadingQuizScreens()
            : const MotorcycleLoadingScreen();
      default:
        return const Center(child: Text("Unknown Category"));
    }
  }
}

class _AttitudeScreenMotorcyleState {}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final int progress;
  final int answered;
  final int correct;
  final int total;
  final bool isSelected;
  final VoidCallback onTap;
  final Widget categoryScreen; // Add the category screen widget as a parameter

  const CategoryItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.progress,
    required this.answered,
    required this.correct,
    required this.total,
    required this.isSelected,
    required this.onTap,
    required this.categoryScreen, // Pass the screen widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.green, size: 30),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              progress > 0 ? Colors.green : Colors.orange,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Answered:  $answered',
                style: GoogleFonts.roboto(color: Colors.orange, fontSize: 12),
              ),
              Text(
                'Correct: $correct',
                style: GoogleFonts.roboto(color: Colors.green, fontSize: 12),
              ),
              Text(
                'Total: $total',
                style:
                    GoogleFonts.roboto(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap: () {
          onTap(); // Toggle category selection
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => categoryScreen,
          //   ),
          //       (Route<dynamic> route) => false, // Removes all previous routes
          // );
        },
        child: Icon(
          isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
        ),
      ),
    );
  }
}
