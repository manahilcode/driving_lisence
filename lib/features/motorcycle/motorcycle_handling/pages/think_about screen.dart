import 'package:flutter/material.dart';

import '../../../../core/appbar.dart';

class ThinkAboutScreen extends StatefulWidget {
  const ThinkAboutScreen({super.key});

  @override
  State<ThinkAboutScreen> createState() => _ThinkAboutScreenState();
}

class _ThinkAboutScreenState extends State<ThinkAboutScreen> {
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
