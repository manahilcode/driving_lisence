import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';

class WeatherConditionScreen extends StatefulWidget {
  const WeatherConditionScreen({super.key});

  @override
  State<WeatherConditionScreen> createState() => _WeatherConditionScreenState();
}

class _WeatherConditionScreenState extends State<WeatherConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: "Alertness",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {},
      ),
      body: Consumer<>(
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
