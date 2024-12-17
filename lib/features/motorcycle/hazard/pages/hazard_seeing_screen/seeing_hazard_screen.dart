import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/loader.dart';
import '../../viewmodel/seeing_hazard_provider.dart';

class SeeingHazardScreen extends StatefulWidget {
  const SeeingHazardScreen({super.key});

  @override
  State<SeeingHazardScreen> createState() => _SeeingHazardScreenState();
}

class _SeeingHazardScreenState extends State<SeeingHazardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title:"Seeing Hazard" , leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<SeeingHazardProvider>(
        builder: (context,provider,child) {
          final data = provider.model;
          if (data == null) {
            return const Center(
              child: LoadingScreen(),
            );
          }
          return Column(
            children: [
              createHeadingText(data.title),
              Gap(10),
              buildImage(data.image),
              Gap(10),
              createAutoSizeText(data.subtitle),
              Gap(10),
              createAutoSizeText(data.subtitle1),
              Gap(10),
              createAutoSizeText(data.subtitle2),
            ],
          );
        }
      ),
    );
  }
}
