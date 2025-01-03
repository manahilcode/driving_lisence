import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/essential_document/pages/things_dicuss_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/think_about.dart';

class ThinkAboutScreenEssential extends StatefulWidget {
  const ThinkAboutScreenEssential({super.key});

  @override
  State<ThinkAboutScreenEssential> createState() => _ThinkAboutScreenEssentialState();
}

class _ThinkAboutScreenEssentialState extends State<ThinkAboutScreenEssential> {
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

                //ThingsDicussScreenEssentailDoc
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThingsDicussScreenEssentailDoc(), // Replace with your next screen
                        ),
                      );
                    },
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 30.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
