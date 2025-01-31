import 'package:flutter/material.dart';
import 'package:driving_lisence/practice_revision_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/Quiz/all_categories_quiz/pages/all_category.dart';
import 'lorry/accident_handling_screen/view/question_screen.dart';
import 'lorry/braking_system_screen/view/question_screen.dart';
import 'lorry/carrying_passenger_Screen/view/question_screen.dart';
import 'lorry/document_screen/view/question_screen.dart';
import 'lorry/driver_hours_rest_peroid_screen/view/question_screen.dart';
import 'lorry/enviromental_issue_screen/view/question_screen.dart';
import 'lorry/getting_start_Screen/view/about_theory.dart';
import 'lorry/leaving_vehicle/view/question_screen.dart';
import 'lorry/other_road_users_Screen/view/question_screen.dart';
import 'lorry/restricted_view/view/question_screen.dart';
import 'lorry/the_driver_system/view/question_screen.dart';
import 'lorry/the_road_Screen/view/question_screen.dart';
import 'lorry/traffic_sign_screen/view/question_screen.dart';
import 'lorry/vehicle_condition_screen/view/question_screen.dart';
import 'lorry/vehicle_loading_Screen/view/question_screen.dart';
import 'lorry/vehicle_weight_dimension_screen/view/question_screen.dart';
import 'menu_screen.dart';
import 'package:flutter/foundation.dart';
import 'features/motorcycle/allertness/pages/allertness.dart'; // Add this line

// ignore: must_be_immutable
class Category2 extends StatefulWidget {
  String? label;
  Category2({super.key, this.label});
  @override
  // ignore: library_private_types_in_public_api
  _Category2State createState() => _Category2State();
}

class _Category2State extends State<Category2>
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
    print("category 2");
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
                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Getting Started',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[0],
                    onTap: () => _toggleSelection(0),
                    categoryScreen: LorryAboutTheoryscreen(),
                  ),
                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Accident Handling',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[1],
                    onTap: () => _toggleSelection(1),
                    categoryScreen: LorryAccidentHandling(),
                  ),
                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Carrying Passenger',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[2],
                    onTap: () => _toggleSelection(2),
                    categoryScreen: BrakingSystemScreen(),
                  ),
                  //CarryingPassengerScreen
                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'CarryingPassenger',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[3],
                    onTap: () => _toggleSelection(3),
                    categoryScreen: CarryingPassengerScreen(),
                  ),
                  //LorryDocumentScreen
                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Lorry Document ',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[4],
                    onTap: () => _toggleSelection(4),
                    categoryScreen: LorryDocumentScreen(),
                  ),

                  //DrivingHourRestPeroidScreen
                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Driving Hour Rest Period',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[5],
                    onTap: () => _toggleSelection(5),
                    categoryScreen: DrivingHourRestPeroidScreen(),
                  ),
                  //EnviromentIssueScreen

                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Environmental Issue',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[6],
                    onTap: () => _toggleSelection(6),
                    categoryScreen: EnviromentIssueScreen(),
                  ),

                  //LeavingVehicleScreen
                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Leaving Vehicle ',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[7],
                    onTap: () => _toggleSelection(7),
                    categoryScreen: LeavingVehicleScreen(),
                  ),

                  //OtherRoadUserScreen
                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Other Road user ',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[8],
                    onTap: () => _toggleSelection(8),
                    categoryScreen: OtherRoadUserScreen(),
                  ),

                  //RestrictedViewScreen
                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: ' Restricted View ',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[9],
                    onTap: () => _toggleSelection(9),
                    categoryScreen: RestrictedViewScreen(),
                  ),
                  //TheDriverSystemScreen
                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: ' The Driver System',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[10],
                    onTap: () => _toggleSelection(10),
                    categoryScreen: TheDriverSystemScreen(),
                  ),
                  //TheRoadScreen

                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'The Road',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[11],
                    onTap: () => _toggleSelection(11),
                    categoryScreen: TheRoadScreen(),
                  ),
                 // TrafficSignScreen

                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Traffic Sign',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[12],
                    onTap: () => _toggleSelection(12),
                    categoryScreen: TrafficSignScreen(),
                  ),
                  //VehicleConditionScreen

                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Vehicle Condition',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[13],
                    onTap: () => _toggleSelection(13),
                    categoryScreen: VehicleConditionScreen(),
                  ),
                  //VehicleLoadingScreen

                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Vehicle Loading',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[14],
                    onTap: () => _toggleSelection(14),
                    categoryScreen: VehicleLoadingScreen(),
                  ),
                  //VehicleWeightDimensionScreen

                  CategoryItem(
                    icon: Icons.notifications_none,
                    title: 'Vehicle Weight & Dimension',
                    progress: 0,
                    answered: 0,
                    correct: 0,
                    total: 0,
                    isSelected: _selectedCategories[15],
                    onTap: () => _toggleSelection(15),
                    categoryScreen: VehicleWeightDimensionScreen(),
                  ),







                ],
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            _getCategoryScreen(selectedIndex)),
                  );
                },
                child: const Text('CONTINUE', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
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
        return LorryAboutTheoryscreen();
      case 1:
        return LorryAccidentHandling();

      case 2:
        return BrakingSystemScreen();

      case 3:
        return CarryingPassengerScreen();

      case 4:
        return LorryDocumentScreen();

      case 5:
        return DrivingHourRestPeroidScreen();

      case 6:
        return EnviromentIssueScreen();

      case 7:
        return LeavingVehicleScreen();

      case 8:
        return OtherRoadUserScreen();

      case 9:
        return RestrictedViewScreen();

      case 10:
        return TheDriverSystemScreen();

      case 11:
        return TheRoadScreen();

      case 12:
        return TrafficSignScreen();

      case 13:
        return VehicleConditionScreen();

      case 14:
        return VehicleLoadingScreen();

      case 15:
        return VehicleWeightDimensionScreen();


      default:
        return const Center(child: Text("Unknown Category"));
    }
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
    super.key,
    required this.icon,
    required this.title,
    required this.progress,
    required this.answered,
    required this.correct,
    required this.total,
    required this.isSelected,
    required this.onTap,
    required this.categoryScreen, // Pass the screen widget
  });

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
