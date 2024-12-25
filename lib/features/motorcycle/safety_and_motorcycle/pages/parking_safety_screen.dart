import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class ParkingSafetyScreen extends StatefulWidget {
  const ParkingSafetyScreen({super.key});

  @override
  State<ParkingSafetyScreen> createState() => _ParkingSafetyScreenState();
}

class _ParkingSafetyScreenState extends State<ParkingSafetyScreen> {
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
