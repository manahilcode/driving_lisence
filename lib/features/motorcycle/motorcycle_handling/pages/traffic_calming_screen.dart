import 'package:flutter/material.dart';

import '../../../../core/appbar.dart';

class TrafficCalmingScreen extends StatefulWidget {
  const TrafficCalmingScreen({super.key});

  @override
  State<TrafficCalmingScreen> createState() => _TrafficCalmingScreenState();
}

class _TrafficCalmingScreenState extends State<TrafficCalmingScreen> {
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
