import 'package:flutter/material.dart';

import '../../../../core/appbar.dart';

class MotorcycleHandlingScreen extends StatefulWidget {
  const MotorcycleHandlingScreen({super.key});

  @override
  State<MotorcycleHandlingScreen> createState() => _MotorcycleHandlingScreenState();
}

class _MotorcycleHandlingScreenState extends State<MotorcycleHandlingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "Alertness",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {},
      ),
      body: Consumer(
          builder: (context,provider,child) {
            final data = provider.tunnelSafety;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Column(
              children: [],
            );
          }
      ),
    );
  }
}
