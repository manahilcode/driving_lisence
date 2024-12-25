import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class FuelEfficientRidingScreen extends StatefulWidget {
  const FuelEfficientRidingScreen({super.key});

  @override
  State<FuelEfficientRidingScreen> createState() => _FuelEfficientRidingScreenState();
}

class _FuelEfficientRidingScreenState extends State<FuelEfficientRidingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer(
          builder: (context,provider,child) {
            return Column(
              children: [],
            );
          }
      ),

    );
  }
}
