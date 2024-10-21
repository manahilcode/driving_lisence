import 'package:driving_lisence/Theory_test.dart';
import 'package:driving_lisence/practice_revision_dialog.dart';
import 'package:flutter/material.dart';

class TheoryTest extends StatelessWidget {
  const TheoryTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Theory Test',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  buildMenuButton(
                    context: context,
                    label: 'Pass Guarantee',
                    color: Colors.orange,
                    icon: Icons.verified_user,
                    badge: 'FREE',
                    navigateTo: TheoryTest(), // Define your screen here
                  ),
                  SizedBox(height: 10),
                  buildMenuButton(
                    context: context,
                    label: 'Practice Revision Questions',
                    color: Colors.green,
                    icon: Icons.assignment,
                    navigateTo: TheoryTest(),
                  ),
                  SizedBox(height: 10),
                  buildMenuButton(
                    context: context,
                    label: 'Mock Test',
                    color: Colors.green,
                    icon: Icons.quiz_outlined,
                    navigateTo: TheoryTest(), // Define your screen here
                  ),
                  SizedBox(height: 10),
                  buildMenuButton(
                    context: context,
                    label: 'Search Questions',
                    color: Colors.green,
                    icon: Icons.search,
                    navigateTo: TheoryTest(), // Define your screen here
                  ),
                  SizedBox(height: 10),
                  buildMenuButton(
                    context: context,
                    label: 'Flagged Questions',
                    color: Colors.green,
                    icon: Icons.flag,
                    navigateTo: TheoryTest(), // Define your screen here
                  ),
                  SizedBox(height: 10),
                  buildMenuButton(
                    context: context,
                    label: 'Progress Monitor',
                    color: Colors.green,
                    icon: Icons.trending_up_rounded,

                    navigateTo: TheoryTest(), // Define your screen here
                  ),
                  SizedBox(height: 10),
                  buildMenuButton(
                    context: context,
                    label: 'Advice and Information',
                    color: Colors.green,
                    icon: Icons.info,
                    navigateTo: TheoryTest(), // Define your screen here
                  ),
                  SizedBox(height: 10),
                  buildMenuButton(
                    context: context,
                    label: 'Learning to Drive',
                    color: Colors.blue,
                    icon: Icons.drive_eta,
                    navigateTo: TheoryTest(), // Define your screen here
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Your Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget buildMenuButton({
    required BuildContext context,
    required String label,
    required Color color,
    required IconData icon,
    String? badge,
    Widget? navigateTo, // Add this parameter for navigation
  }) {
    return GestureDetector(
      onTap: () {
        if (label == 'Practice Revision Questions') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return PracticeRevisionDialog();
            },
          );
        } else if (navigateTo != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateTo),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Icon(icon, color: color, size: 40),
          title: Text(
            label,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          trailing: badge != null
              ? Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              badge,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          )
              : null,
        ),
      ),
    );
  }
}
