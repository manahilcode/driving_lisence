import 'package:driving_lisence/alert1_info.dart';
import 'package:driving_lisence/hazard1.dart';
import 'package:driving_lisence/safety_margin1.dart';
import 'package:driving_lisence/vehicle_safety_1.dart';
import 'package:flutter/material.dart';
import 'package:driving_lisence/attitude_practice_Question_screen.dart';
import 'package:driving_lisence/practice_revision_dialog.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<bool> _selectedCategories = List.generate(15, (_) => true); // 15 categories

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        title: Text('Practise Revision Questions'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
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
                  categoryScreen:PracticeRevisionDialog()
                ),
                CategoryItem(
                  icon: Icons.drive_eta,
                  title: 'Attitude',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 27,
                  isSelected: _selectedCategories[2],
                  onTap: () => _toggleSelection(2),
                  categoryScreen: Tip_attitude_1(),
                ),
                CategoryItem(
                  icon: Icons.speed,
                  title: 'Safety and your vehicle',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 54,
                  isSelected: _selectedCategories[3],
                  onTap: () => _toggleSelection(3),
                  categoryScreen: Safety_1(),
                ),
                CategoryItem(
                  icon: Icons.traffic,
                  title: 'Safety margins',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 27,
                  isSelected: _selectedCategories[4],
                  onTap: () => _toggleSelection(4),
                  categoryScreen: safety_margin1(),
                ),
                CategoryItem(
                  icon: Icons.visibility,
                  title: 'Hazard awareness',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 28,
                  isSelected: _selectedCategories[5],
                  onTap: () => _toggleSelection(5),
                  categoryScreen: hazard1(),
                ),
                CategoryItem(
                  icon: Icons.local_hospital,
                  title: 'Vulnerable road users',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 24,
                  isSelected: _selectedCategories[6],
                  onTap: () => _toggleSelection(6),
                  categoryScreen: PracticeRevisionDialog(),
                ),
                CategoryItem(
                  icon: Icons.navigation,
                  title: 'Other types of vehicle',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 27,
                  isSelected: _selectedCategories[7],
                  onTap: () => _toggleSelection(7),
                  categoryScreen: PracticeRevisionDialog(),
                ),
                CategoryItem(
                  icon: Icons.car_crash_outlined,
                  title: 'Road conditions and vehicle handling',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 27,
                  isSelected: _selectedCategories[8],
                  onTap: () => _toggleSelection(8),
                  categoryScreen: PracticeRevisionDialog(),
                ),
                CategoryItem(
                  icon: Icons.car_crash_outlined,
                  title: 'Vehicle handling',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 28,
                  isSelected: _selectedCategories[9],
                  onTap: () => _toggleSelection(9),
                  categoryScreen: PracticeRevisionDialog(),
                ),
                CategoryItem(
                  icon: Icons.emoji_people,
                  title: 'Motorway rules',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 26,
                  isSelected: _selectedCategories[10],
                  onTap: () => _toggleSelection(10),
                  categoryScreen: PracticeRevisionDialog(),
                ),
                CategoryItem(
                  icon: Icons.lightbulb_outline,
                  title: 'Rules of the road',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 54,
                  isSelected: _selectedCategories[11],
                  onTap: () => _toggleSelection(11),
                  categoryScreen: PracticeRevisionDialog(),
                ),
                CategoryItem(
                  icon: Icons.local_police,
                  title: 'Road and traffic signs',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 67,
                  isSelected: _selectedCategories[12],
                  onTap: () => _toggleSelection(12),
                  categoryScreen: PracticeRevisionDialog(),
                ),
                CategoryItem(
                  icon: Icons.build,
                  title: 'Essential documents',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 27,
                  isSelected: _selectedCategories[13],
                  onTap: () => _toggleSelection(13),
                  categoryScreen: PracticeRevisionDialog(),
                ),
                CategoryItem(
                  icon: Icons.warning_amber_rounded,
                  title: 'Incidents, accidents, and emergencies',
                  progress: 0,
                  answered: 0,
                  correct: 0,
                  total: 31,
                  isSelected: _selectedCategories[14],
                  onTap: () => _toggleSelection(14),
                  categoryScreen: PracticeRevisionDialog(),
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
              child: Text('CONTINUE', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Implement continue functionality
              },
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
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4),
          LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              progress > 0 ? Colors.green : Colors.orange,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text('Answered: $answered', style: TextStyle(color: Colors.orange)),
              SizedBox(width: 8),
              Text('Correct: $correct', style: TextStyle(color: Colors.green)),
              SizedBox(width: 8),
              Text('Total: $total', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ],
      ),
      trailing:
      GestureDetector(
        onTap: () {
          onTap(); // Toggle category selection
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => categoryScreen, // Navigate to the selected screen
            ),
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
