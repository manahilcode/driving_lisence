import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class SafetyYourMotorcycleScreen extends StatefulWidget {
  const SafetyYourMotorcycleScreen({super.key});

  @override
  State<SafetyYourMotorcycleScreen> createState() => _SafetyYourMotorcycleScreenState();
}

class _SafetyYourMotorcycleScreenState extends State<SafetyYourMotorcycleScreen> {
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
