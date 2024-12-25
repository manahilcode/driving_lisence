import 'package:flutter/material.dart';

import '../../../../core/appbar.dart';

class RidingAtNightScreen extends StatefulWidget {
  const RidingAtNightScreen({super.key});

  @override
  State<RidingAtNightScreen> createState() => _RidingAtNightScreenState();
}

class _RidingAtNightScreenState extends State<RidingAtNightScreen> {
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
