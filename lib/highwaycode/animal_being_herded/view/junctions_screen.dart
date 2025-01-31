import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/appbar.dart';
import '../../../core/loader.dart';
import '../../../highwaycode_categories.dart';
import '../viewmodel/junctions_controller.dart';

class JunctionsScreenHighway extends StatefulWidget {
  const JunctionsScreenHighway({super.key});

  @override
  State<JunctionsScreenHighway> createState() => _JunctionsScreenHighwayState();
}

class _JunctionsScreenHighwayState extends State<JunctionsScreenHighway> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
            (_) {
          final provider = Provider.of<JunctionProvider>(context, listen: false);
          provider.fetchJunction("Junctions");
        }


    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Junction", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),
      body: Consumer<JunctionProvider>(
          builder: (context,provider,child) {
            final data = provider.junction;
            if(data == null)
            {
              return LoadingScreen();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                
                  children: [
                    createHeadingText(data.header),
                    Gap(10),
                    createAutoSizeText(data.text1),
                    Gap(10),
                    createAutoSizeText(data.text2),
                    Gap(10),
                    createAutoSizeText(data.text3),
                    Gap(10),
                    createAutoSizeText(data.text4),
                    Gap(10),
                    createAutoSizeText(data.text5),
                    Gap(10),
                    createAutoSizeText(data.text6),
                    Gap(10),
                    createAutoSizeText(data.text7),
                    Gap(10),
                    createAutoSizeText(data.text8),
                    Gap(10),
                    createAutoSizeText(data.text9),
                    Gap(10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          //   Navigate to the next tip or page
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HighwaycodeCategories(),
                            ),
                                (Route<dynamic> route) =>
                            false, // Removes all previous routes
                          );
                        },
                        child: Center(
                          child: Container(
                            width: 300,
                            padding: const EdgeInsets.symmetric(
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
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Center(
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
