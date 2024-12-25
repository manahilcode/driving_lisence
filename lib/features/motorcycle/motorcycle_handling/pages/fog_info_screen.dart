import 'package:flutter/material.dart';

import '../../../../core/appbar.dart';

class FogInfoScreen extends StatefulWidget {
  const FogInfoScreen({super.key});

  @override
  State<FogInfoScreen> createState() => _FogInfoScreenState();
}

class _FogInfoScreenState extends State<FogInfoScreen> {
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
