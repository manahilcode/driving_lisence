import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Theory_test.dart';
import '../../../category.dart';
import '../../../category1.dart';
import '../../../category2.dart';
import '../../../highwaycode_categories.dart';
import '../../auth/viewmodel/controller.dart';
import '../../auth/viewmodel/user_provider.dart';
import '../../car_hazard_perception_screen.dart';
import '../../motorcycle_hazard_perception_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0, // No app bar height
      ),
      body:  SingleChildScrollView(
        child: Consumer<AuthController>(
            builder: (context,value,child) {
              final userName = value.name;
              return Column(
                children: [

                  // ElevatedButton(onPressed: ()async{
                  //   final _auth = AuthRepository();
                  //   await _auth.signOut();
                  // }, child: Text("Logoout")),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.green.withOpacity(0.70),
                      ),
                      width: double.infinity, // Cover full width
                      height: 150,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              " $userName " ?? "",
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Black text for contrast
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              'You are using the car driver’s question bank',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white, // White text for contrast
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Consumer<UserProvider>(
                      builder: (context,provider ,child) {
                        final users = provider.user;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              buildMenuButton(
                                context: context,
                                label: 'Start Learning',
                                color: Colors.pink,
                                icon: Icons.verified_user,
                                badge: 'FREE',
                                navigateTo:users?.category == "Motorcycle" ?  Category1() :users?.category == "LGV (Lorry)" ? Category2():Category(), // Define your screen here
                              ),
                              const SizedBox(height: 10),
                              buildMenuButton(
                                context: context,
                                label: 'Theory Test',
                                color: Colors.green,
                                icon: Icons.assignment,
                                navigateTo: TheoryTest(), // Define your screen here
                              ),
                              SizedBox(height: 10),
                              Consumer<UserProvider>(
                                  builder: (context, provider,child) {
                                    final users = provider.user;
                                    log(users?.category.toString() ?? "");
                                    return buildMenuButton(
                                      context: context,
                                      label: 'Hazard Perception',
                                      color: Colors.red,
                                      icon: Icons.warning,
                                      navigateTo:users?.category == "Car" ? CarHazardPerceptionScreen():MotorcycleHazardPerceptionScreen(), // Define your screen here
                                    );
                                  }
                              ),
                              SizedBox(height: 10),
                              buildMenuButton(
                                context: context,
                                label: 'Highway Code',
                                color: Colors.blue,
                                icon: Icons.book,
                                navigateTo: HighwaycodeCategories(), // Define your screen here
                              ),
                              SizedBox(height: 10),
                              buildMenuButton(
                                context: context,
                                label: 'Road Signs',
                                color: Colors.orange,
                                icon: Icons.traffic,
                                navigateTo: TheoryTest(), // Define your screen here
                              ),
                              SizedBox(height: 10),
                              buildMenuButton(
                                context: context,
                                label: 'Learn to Drive',
                                color: Colors.purple,
                                icon: Icons.directions_car,
                                badge: 'FREE TRIAL',
                                navigateTo: TheoryTest(), // Define your screen here
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
  Widget buildMenuButton({
    required BuildContext context,
    required String label,
    required Color color,
    required IconData icon,
    String? badge,
    required Widget navigateTo, // Add this parameter for navigation
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateTo),
        );
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

