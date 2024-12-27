import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/think_about.dart';

class ThinkAboutScreen extends StatefulWidget {
  const ThinkAboutScreen({super.key});

  @override
  State<ThinkAboutScreen> createState() => _ThinkAboutScreenState();
}

class _ThinkAboutScreenState extends State<ThinkAboutScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ThinkAboutMotorcycleInfoProvider>(context, listen: false);
      provider.fetchTaxingMotorcycleInfo();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
          title: "Alertness",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),

      body: Consumer<ThinkAboutMotorcycleInfoProvider>(
          builder: (context,provider,child) {
            final data = provider.taxingMotorcycleInfo;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Column(
              children: [
               createHeadingText(data.title),
                Column(
                  children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                ),
              ],
            );
          }
      ),
    );
  }
}
