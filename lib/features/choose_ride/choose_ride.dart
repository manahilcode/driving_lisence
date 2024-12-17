import 'package:driving_lisence/features/auth/viewmodel/controller.dart';
import 'package:driving_lisence/features/book_theory/booked_theory_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../menu_screen.dart';
import '../auth/repo/auth_repo.dart';
import '../../../../category.dart' as cat;

class chooseride extends StatefulWidget {
  const chooseride({super.key});

  @override
  _chooserideState createState() => _chooserideState();
}

class _chooserideState extends State<chooseride> {
  String selectedRegion = '';
  String selectedCategory = '';

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((t) {
      AuthRepository _auth = AuthRepository();
      _auth.authStateChanges.listen((user) {
        if (user != null) {
          if (mounted) {
            Route newRoute =
                MaterialPageRoute(builder: (context) => MenuScreen());

            Navigator.pushAndRemoveUntil(
              context,
              newRoute,
              (Route<dynamic> route) => false, // Removes all previous routes
            );
          }

          print('User is signed in: ${user.uid}');
        } else {
          print('User is not signed in');
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hey Jamal,",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                "Which vehicle category are you learning?",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              _buildCategoryOption(Icons.directions_car, "Car"),
              _buildCategoryOption(Icons.motorcycle, "Motorcycle"),
              _buildCategoryOption(
                  Icons.assignment, "Trainee ADI (Instructor)"),
              _buildCategoryOption(Icons.local_shipping, "LGV (Lorry)"),
              _buildCategoryOption(Icons.directions_bus, "PCV (Bus)"),
              const SizedBox(height: 25),
              const Text(
                "Where are you taking your Theory Test?",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildRegionContainer('GB'),
                  const SizedBox(width: 16),
                  _buildRegionContainer('NI'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, size: 30),
              onPressed: () {
                // Handle Back navigation
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward, size: 30),
              onPressed: () async {
                if (selectedCategory.isEmpty) {
                  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                      const SnackBar(content: Text("select any category")));
                } else if (selectedCategory == "Car") {
                  final auth =
                      Provider.of<AuthController>(context, listen: false);
                  auth.setUsrData(selectedCategory);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YourTheoryTestScreen(
                          selectedCategory: selectedCategory ,
                        )),
                  );
                }else if(selectedCategory ==  "Motorcycle")
                  {
                    final auth =
                    Provider.of<AuthController>(context, listen: false);
                    auth.setUsrData(selectedCategory);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YourTheoryTestScreen(
                            selectedCategory: selectedCategory ,
                          )),
                    );
                  }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryOption(IconData icon, String category) {
    bool isSelected = selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withOpacity(0.1) : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Icon(icon, size: 32),
          title: Text(category),
          trailing:
              isSelected ? const Icon(Icons.check, color: Colors.green) : null,
          onTap: () {
            setState(() {
              selectedCategory = category;
            });
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
        height: 40,
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
