import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../core/loader.dart';
import '../../repo/hazard_managment_repo.dart';
import '../../viewmodel/hazard_managment_provider.dart';

class HazardManagment extends StatefulWidget {
  const HazardManagment({super.key});

  @override
  State<HazardManagment> createState() => _HazardManagmentState();
}

class _HazardManagmentState extends State<HazardManagment> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Hazard Management", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<HazardManagementProvider>(
        builder: (context,provider,child) {
          final data  = provider.hazard;
          if (data == null) {
            return const Center(
              child: LoadingScreen(),
            );
          }

          return Column(

            children: [
              createHeadingText(data.title),
              createAutoSizeText(data.subtitle),
              Gap(10),
             Container(
               decoration: BoxDecoration(

               ),
               child: Column(
                 children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
               ),

             ),

              buildTipWidget(data.tip),

            ],
          );
        }
      ),
    );
  }
}
