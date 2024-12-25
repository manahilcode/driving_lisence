import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class LookingAfterMotorcycleScreen extends StatefulWidget {
  const LookingAfterMotorcycleScreen({super.key});

  @override
  State<LookingAfterMotorcycleScreen> createState() => _LookingAfterMotorcycleScreenState();
}

class _LookingAfterMotorcycleScreenState extends State<LookingAfterMotorcycleScreen> {
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
