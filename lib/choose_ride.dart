import 'package:driving_lisence/booked_theory_test.dart';
import 'package:flutter/material.dart';

class chooseride extends StatefulWidget {
  @override
  _chooserideState createState() => _chooserideState();
}

class _chooserideState extends State<chooseride> {
  String selectedRegion = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'About Your Test',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Text(
                'Progress Tracker',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey Jamal,",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Which vehicle category are you learning?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            _buildCategoryOption(Icons.directions_car, "Car"),
            _buildCategoryOption(Icons.motorcycle, "Motorcycle"),
            _buildCategoryOption(Icons.assignment, "Trainee ADI (Instructor)"),
            _buildCategoryOption(Icons.local_shipping, "LGV (Lorry)"),
            _buildCategoryOption(Icons.directions_bus, "PCV (Bus)"),
            SizedBox(height: 32),
            Text(
              "Where are you taking your Theory Test?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRegionContainer('GB'),
                SizedBox(width: 16),
                _buildRegionContainer('NI'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, size: 30),
              onPressed: () {
                // Handle Back navigation
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YourTheoryTestScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryOption(IconData icon, String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Icon(icon, size: 32),
          title: Text(category),
          onTap: () {
            // Handle tap event
          },
        ),
      ),
    );
  }

  Widget _buildRegionContainer(String region) {
    bool isSelected = selectedRegion == region;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRegion = region;
        });
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            region,
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
