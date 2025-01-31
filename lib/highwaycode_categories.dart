import 'package:driving_lisence/core/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/list_highway_code.dart';
import 'highwaycode/animal_being_herded/view/crossing_the_road_screen.dart';
import 'highwaycode/animal_being_herded/view/junctions_screen.dart';

class HighwaycodeCategories extends StatefulWidget {
  const HighwaycodeCategories({super.key});

  @override
  State<HighwaycodeCategories> createState() => _HighwaycodeCategoriesState();
}

class _HighwaycodeCategoriesState extends State<HighwaycodeCategories> {
  final List<bool> _selectedCategories = List.generate(115, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Highway code",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () => Navigator.pop(context),
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) => HighwayCodeCategoryItem(
          title: topics[index],
          progress: 0, // Replace with actual progress value
          isSelected: _selectedCategories[index],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    _getCategoryScreen(index)),
          ),
        ),
      ),
    );
  }
  Widget _getCategoryScreen(int index) {
    switch (index) {
      case 0:
        return CrossingTheRoadScreenHighway();
      case 1:
        return JunctionsScreenHighway();




      default:
        return const Center(child: Text("Unknown Category"));
    }
  }
}

class HighwayCodeCategoryItem extends StatelessWidget {
  final String title;
  final double progress;
  final bool isSelected;
  final VoidCallback onTap;

  const HighwayCodeCategoryItem({
    super.key,
    required this.title,
    required this.progress,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.notifications_none, color: Colors.green, size: 30),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _buildProgressSubtitle(),
      trailing: GestureDetector(
        onTap: onTap,
        child: Icon(
          isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _buildProgressSubtitle() {
    return Column(
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
        _buildStatsRow(),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatText('Answered: ', Colors.orange),
        _buildStatText('Correct: ', Colors.green),
        _buildStatText('Total: ', Colors.grey[600]!),
      ],
    );
  }

  Widget _buildStatText(String label, Color color) {
    return Text(
      label,
      style: GoogleFonts.roboto(color: color, fontSize: 12),
    );
  }
}