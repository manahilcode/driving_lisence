import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/cyclist_provider.dart';
import 'other_motorcycle_Screen.dart';

class CyclistScreen extends StatefulWidget {
  const CyclistScreen({super.key});

  @override
  State<CyclistScreen> createState() => _CyclistScreenState();
}

class _CyclistScreenState extends State<CyclistScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CyclistProvider>(context, listen: false);
      provider.fetchCyclistData("Cyclists");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Cyclist", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<CyclistProvider>(
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
                    createHeadingText(data.title),
                    createAutoSizeText(data.subtitle),
                    buildImage(data.image),
                    createHeadingText(data.title1),
                    createAutoSizeText(data.subtitle1),
                    buildImage(data.image1),
                    createHeadingText(data.title2),
                    createAutoSizeText(data.subtitle2),
                    buildImage(data.image2),
                    createHeadingText(data.title3),
                    createAutoSizeText(data.subtitle3),
                    buildImage(data.image2),
                    Gap(20),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtherMotorcycleScreen(), // Replace with your next screen
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
                ),
              ),
            );
          }
      ),
    );
  }
}
