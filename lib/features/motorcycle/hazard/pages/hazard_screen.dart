import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/hazard_provider.dart';

class HazardScreen extends StatefulWidget {
  const HazardScreen({super.key});

  @override
  State<HazardScreen> createState() => _HazardScreenState();
}

class _HazardScreenState extends State<HazardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        title: 'Introduction',
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {
        },
      ),
      body: Consumer<MotorcycleHazardProvider>(
        builder: (context,provider,child) {
          final data = provider.motorcycleHazard;
          print(data);
          if (data == null) {
            return const Center(
              child: LoadingScreen(),
            );
          }


          return Column(
            children: [
              createHeadingText(provider.motorcycleHazard?.title ?? ""),
              createAutoSizeText(provider.motorcycleHazard?.subtitle ?? ""),
              buildImage(provider.motorcycleHazard?.image ?? "")
            ],
          );
        }
      ),
    );
  }
}
