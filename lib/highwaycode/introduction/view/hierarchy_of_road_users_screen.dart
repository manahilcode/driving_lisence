import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../core/sharedUi.dart';
import '../viewmodel/hierarchy_of_road_users_controller.dart';

class HierarchyOfRoadUsersScreenHighway extends StatefulWidget {
  const HierarchyOfRoadUsersScreenHighway({super.key});

  @override
  State<HierarchyOfRoadUsersScreenHighway> createState() => _HierarchyOfRoadUsersScreenHighwayState();
}

class _HierarchyOfRoadUsersScreenHighwayState extends State<HierarchyOfRoadUsersScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<HierarchyProvider>(context, listen: false);
          provider.fetchHierarchyData();
        }


    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "hierarchy of road users", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<HierarchyProvider>(
          builder: (context,provider,child) {
            final data = provider.data;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    createAutoSizeText(data.heading),
                    Gap(10),
                    createAutoSizeText(data.text),
                    Gap(10),
                    buildImage(data.image),
                    Gap(10),
                    createAutoSizeText(data.heading2),
                    Gap(10),
                    createAutoSizeText(data.text1),
                    Gap(10),
                    buildImage(data.image1),
                    Gap(10),
                    createAutoSizeText(data.heading1),
                    Gap(10),
                    createAutoSizeText(data.text2),
                    Gap(10),
                    Column(
                      children: data.points1.map((e) => buildBulletText(e.toString())).toList(),
                    ),
                    Gap(10),



                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
