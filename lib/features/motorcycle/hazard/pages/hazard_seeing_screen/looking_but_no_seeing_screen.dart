import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/loader.dart';
import '../../viewmodel/looking_seeing_provider.dart';

class LookingButNoSeeingScreen extends StatefulWidget {
  const LookingButNoSeeingScreen({super.key});

  @override
  State<LookingButNoSeeingScreen> createState() => _LookingButNoSeeingScreenState();
}

class _LookingButNoSeeingScreenState extends State<LookingButNoSeeingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Looking But not seeing ", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body:Consumer<LookingButNotSeeingProvider>(
        builder: (context,provider,child) {
          final data = provider.lookingModels;
          if (data == null) {
            return const Center(
              child: LoadingScreen(),
            );
          }

          return Column(
            children: [
              createHeadingText(data[0].title),
              Gap(10),

              createAutoSizeText(data[0].subtitle),
              Gap(10),
              buildImage(data[0].image),
              Gap(10),
              createAutoSizeText(data[0].subtitle1),
              Gap(10),
            ],
          );
        }
      ),
    );
  }
}
