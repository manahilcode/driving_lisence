import 'package:driving_lisence/features/hazard/pages/hazard1.dart';
import 'package:driving_lisence/features/safety_margin/pages/safety_margin1.dart';
import 'package:driving_lisence/features/vulnerable_road_user/pages/introduction.dart';
import 'package:flutter/material.dart';
import 'package:driving_lisence/practice_revision_dialog.dart';

import 'features/Quiz/Incident_quiz/pages/incident_quiz.dart';
import 'features/Quiz/Rule_of_the_road/pages/rule_of_raod_quiz.dart';
import 'features/Quiz/alertness_quiz/pages/alertnessquiz.dart';
import 'features/Quiz/attitude_quiz/pages/attitude_quiz.dart';
import 'features/Quiz/essential_document_quiz/pages/essential_document_quiz.dart';
import 'features/Quiz/hazard_awareness_quiz/pages/hazard_awareness.dart';
import 'features/Quiz/motorway_driving_quiz/pages/motorway_handling.dart';
import 'features/Quiz/other_type_vehicle_quiz/pages/other_type_of_vehicle.dart';
import 'features/Quiz/road_traffic_sign_quiz/pages/road_traffic_sign_quiz.dart';
import 'features/Quiz/safety_margin_quiz/pages/safety_margin_quiz.dart';
import 'features/Quiz/safety_vehicle_quiz/pages/safetyVehicle.dart';
import 'features/Quiz/vehicle_handling_quiz/pages/vehicle_handling.dart';
import 'features/Quiz/vehicle_handling_quiz/viewmodel/controller.dart';
import 'features/Quiz/vehicle_loading_quiz/pages/vehicle_loading_quiz.dart';
import 'features/Quiz/vulnerable_road_user_quiz/pages/vulnerable_road_user.dart';
import 'features/allertness/model/model.dart';
import 'features/allertness/pages/introduction.dart';
import 'features/attitude/pages/attitude.dart';
import 'features/essential_document/pages/introduction.dart';
import 'features/incident/pages/incident_accident_and_emergency.dart';
import 'features/motor_way_Driving/pages/introduction.dart';
import 'features/road_and_traffic_sign/pages/introduction.dart';
import 'features/rule_of_road/pages/introduction.dart';
import 'features/vehicle_handling/pages/introduction.dart';
import 'features/vehicle_loading/pages/introduction.dart';
import 'features/vehicle_safety/pages/vehicle_safety_1.dart';

class Category extends StatefulWidget {
  String? label;
  Category({super.key, this.label});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<bool> _selectedCategories =
      List.generate(16, (_) => false); // 15 categories

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    print(widget.label ?? "");
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Practise Revision Questions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Category'),
            Tab(text: 'Progress'),
            Tab(text: 'Selected'),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Adding all category items here
                CategoryItem(
                  icon: Icons.list,
                  title: 'All categories',
                  progress: 0,
                  answered: 19,
                  correct: 6,
                  total: 774,
                  isSelected: _selectedCategories[0],
                  onTap: () => _toggleSelection(0),
                  categoryScreen: PracticeRevisionDialog(),
                ),
                CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Alertness',
                    progress: 0,
                    answered: 1,
                    correct: 0,
                    total: 26,
                    isSelected: _selectedCategories[1],
                    onTap: () => _toggleSelection(1),
                    categoryScreen: widget.label == "PracticeQuiz"
                        ? const QuizScreen()
                        : const IntroductionAlertness()),
                CategoryItem(
                  icon: Icons.drive_eta,
                  title: 'Attitude',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 27,
                  isSelected: _selectedCategories[2],
                  onTap: () => _toggleSelection(2),
                  categoryScreen:widget.label == "PracticeQuiz"
                      ?  const AttitudeQuizScreens()
                      : const Tip_attitude_1(),
                ),
                //
                CategoryItem(
                  icon: Icons.speed,
                  title: 'Safety and your vehicle',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 54,
                  isSelected: _selectedCategories[3],
                  onTap: () => _toggleSelection(3),
                  categoryScreen: widget.label == "PracticeQuiz"
                      ?  const SafetyVehicleQuizScreens()
                      : Safety_1(),
                ),
                //SafetyMarginQuizScreens
                CategoryItem(
                  icon: Icons.traffic,
                  title: 'Safety margins',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 27,
                  isSelected: _selectedCategories[4],
                  onTap: () => _toggleSelection(4),
                  categoryScreen:widget.label == "PracticeQuiz"
                      ?  const SafetyMarginQuizScreens()
                      : safety_margin1(),
                ),
                //HazardAwarenessQuizScreens
                CategoryItem(
                  icon: Icons.visibility,
                  title: 'Hazard awareness',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 28,
                  isSelected: _selectedCategories[5],
                  onTap: () => _toggleSelection(5),
                  categoryScreen: widget.label == "PracticeQuiz"
                      ?  const HazardAwarenessQuizScreens()
                      :hazard1(),
                ),
                //SafetyMarginQuizScreens
                CategoryItem(
                  icon: Icons.local_hospital,
                  title: 'Vulnerable road users',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 24,
                  isSelected: _selectedCategories[6],
                  onTap: () => _toggleSelection(6),
                  categoryScreen: widget.label == "PracticeQuiz"
                      ?  const VulnerableRoadUserQuizScreens()
                      :const Introduction(),
                ),
                //OtherTypeVehicleQuizScreen
                CategoryItem(
                  icon: Icons.navigation,
                  title: 'Other types of vehicle',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 27,
                  isSelected: _selectedCategories[7],
                  onTap: () => _toggleSelection(7),
                  categoryScreen:widget.label == "PracticeQuiz"
                      ?  const OtherTypeVehicleQuizScreen()
                      : PracticeRevisionDialog(),
                ),
 //MotowayDriverQuizScreens
                CategoryItem(
                  icon: Icons.car_crash_outlined,
                  title: 'Motorway driving',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 27,
                  isSelected: _selectedCategories[8],
                  onTap: () => _toggleSelection(8),
                  categoryScreen: widget.label == "PracticeQuiz"
                      ?  const MotowayDriverQuizScreens()
                      :const IntroductionHighWay(),
                ),
                //VehicleHandlingQuizProvider
                CategoryItem(
                  icon: Icons.car_crash_outlined,
                  title: 'Vehicle handling',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 28,
                  isSelected: _selectedCategories[9],
                  onTap: () => _toggleSelection(9),
                  categoryScreen:widget.label == "PracticeQuiz"
                      ? const VehicleHandlingQuizScreens()
                      :  const IntroductionVehicleHandling(),
                ),
                // CategoryItem(
                //   icon: Icons.emoji_people,
                //   title: 'Motorway rules',
                //   progress: 0,
                //   answered: 0,
                //   correct: 0,
                //   total: 26,
                //   isSelected: _selectedCategories[10],
                //   onTap: () => _toggleSelection(10),
                //   categoryScreen: PracticeRevisionDialog(),
                // ),
                //RuleOfRoadQuizScreens
                CategoryItem(
                  icon: Icons.lightbulb_outline,
                  title: 'Rules of the road',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 54,
                  isSelected: _selectedCategories[11],
                  onTap: () => _toggleSelection(11),
                  categoryScreen: widget.label == "PracticeQuiz"
                      ? const RuleOfRoadQuizScreens()
                      :  const IntroductionRoadRule(),
                ),
                //RoadTrafficSignQuizScreens
                CategoryItem(
                  icon: Icons.local_police,
                  title: 'Road and traffic signs',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 67,
                  isSelected: _selectedCategories[12],
                  onTap: () => _toggleSelection(12),
                  categoryScreen: widget.label == "PracticeQuiz"
                      ? const RoadTrafficSignQuizScreens()
                      :const IntroductionRoadSign(),
                ),
                //EssentialDocumentQuizScreens
                CategoryItem(
                  icon: Icons.build,
                  title: 'Essential documents',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 27,
                  isSelected: _selectedCategories[13],
                  onTap: () => _toggleSelection(13),
                  categoryScreen: widget.label == "PracticeQuiz"
                      ? const EssentialDocumentQuizScreens()
                      :
                  const IntroductionEDocumentt(),
                ),
                //IncidentQuizScreens
                CategoryItem(
                  icon: Icons.warning_amber_rounded,
                  title: 'Incidents, accidents, and emergencies',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 31,
                  isSelected: _selectedCategories[14],
                  onTap: () => _toggleSelection(14),
                  categoryScreen:widget.label == "PracticeQuiz"
                      ? const IncidentQuizScreens()
                      :  const IncidentAccidentAndEmergency(),
                ),
                //VehicleLoadingQuizScreens
                CategoryItem(
                  icon: Icons.warning_amber_rounded,
                  title: 'Vehicle Loading',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 31,
                  isSelected: _selectedCategories[15],
                  onTap: () => _toggleSelection(15),
                  categoryScreen: widget.label == "PracticeQuiz"
                      ? const VehicleLoadingQuizScreens()
                      :  const IntroductionVehicleLoading(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Select one or more categories to revise',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
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
                // Implement continue functionality
              },
              child: const Text('CONTINUE', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSelection(int index) {
    setState(() {
      _selectedCategories[index] = !_selectedCategories[index];
    });
  }
}

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
            children: [
              Text('Answered: $answered',
                  style: const TextStyle(color: Colors.orange)),
              const SizedBox(width: 8),
              Text('Correct: $correct', style: const TextStyle(color: Colors.green)),
              const SizedBox(width: 8),
              Text('Total: $total', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap: () {
          onTap(); // Toggle category selection
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => categoryScreen,
            ),
            (Route<dynamic> route) => false, // Removes all previous routes
          );
        },
        child: Icon(
          isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
        ),
      ),
    );
  }
}
