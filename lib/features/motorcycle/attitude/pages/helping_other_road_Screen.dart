import 'package:driving_lisence/core/imagewithtext.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/helping_other_road_provider.dart';
import 'animal_on_road_Screen.dart';

class HelpingOtherRoadScreen extends StatefulWidget {
  const HelpingOtherRoadScreen({super.key});

  @override
  State<HelpingOtherRoadScreen> createState() => _HelpingOtherRoadScreenState();
}

class _HelpingOtherRoadScreenState extends State<HelpingOtherRoadScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<DazzleProviderAttitude>(context, listen: false);
      provider.fetchDazzleData("motorcycle_attitude", "Helping_other_road_users");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: CustomAppBar(
          title: "Helping other road",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<DazzleProviderAttitude>(
          builder: (context,provider,child) {
            final data = provider.data;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                  createHeadingText(data.title),
                    createAutoSizeText(data.subtitle),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: buildTipWidget(data.tip),
                   ),
                    createHeadingText(data.title1),
                    createAutoSizeText(data.subtitle1),
                    Column(
                      children: [
                        createHeadingText(data.definition["title"]),
                        createAutoSizeText(data.definition["subtitle"])
                      ],
                    ),

                    createAutoSizeText(data.subtitle2),
                    Column(
                      children: [
                        ImageWithTextCard(imageUrl: data.image.image, subtitle: data.image.text),
                        ImageWithTextCard(imageUrl: data.image2.image, subtitle: data.image2.text),
                      ],
                    ),
                    createAutoSizeText(data.subtitle3),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimalOnRoadScreen(), // Replace with your next screen
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
