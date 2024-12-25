import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';

class CarryPassengerLoadScreen extends StatefulWidget {
  const CarryPassengerLoadScreen({super.key});

  @override
  State<CarryPassengerLoadScreen> createState() => _CarryPassengerLoadScreenState();
}

class _CarryPassengerLoadScreenState extends State<CarryPassengerLoadScreen> {
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
