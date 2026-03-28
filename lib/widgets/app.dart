import 'package:flutter/material.dart';

import 'home_page.dart';

class DrivingLicenceApp extends StatelessWidget {
  const DrivingLicenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Driving Licence (Offline)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F172A)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
