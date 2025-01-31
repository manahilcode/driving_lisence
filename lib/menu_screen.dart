import 'dart:developer';

import 'package:driving_lisence/Theory_test.dart';
import 'package:driving_lisence/category.dart';
import 'package:driving_lisence/features/pass_gaurantee/pages/pass_gaurantee1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'ShareScreen/shareScreen.dart';
import 'YourOffersScreen/offerScreen.dart';
import 'category1.dart';
import 'category2.dart';
import 'features/auth/profile/profile.dart';
import 'features/auth/repo/auth_repo.dart';
import 'features/auth/viewmodel/controller.dart';
import 'features/auth/viewmodel/user_provider.dart';
import 'features/car_hazard_perception_screen.dart';
import 'features/home/pages/home.dart';
import 'features/motorcycle_hazard_perception_screen.dart';
import 'moreScreen/morescreen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((time) async {
      final user = Provider.of<UserProvider>(context, listen: false);
      final auth = Provider.of<AuthController>(context, listen: false);
      final uid = FirebaseAuth.instance.currentUser?.uid;
      await user.fetchUserData(uid!);
      await auth.fetchAndDisplayUserProfile();
    });
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    // Add your screens here
    Homescreen(),
    Offerscreen(),
    ProfileScreen(),
    Morescreen(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0, // No app bar height
      ),
      body: _pages[_currentIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
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
}


