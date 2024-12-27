import 'package:driving_lisence/core/imagewithtext.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/following_safety_provider.dart';
import '../viewmodel/giving_priority_other_provider.dart';

class GivingPriorityScreen extends StatefulWidget {
  const GivingPriorityScreen({super.key});

  @override
  State<GivingPriorityScreen> createState() => _GivingPriorityScreenState();
}

class _GivingPriorityScreenState extends State<GivingPriorityScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<GivingPriorityToOthersProviderAttitude>(context, listen: false);
      provider.fetchGivingPriorityToOthersData("motorcycle_attitude", "Giving_priority_to_others");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
          title: "Giving priority",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<GivingPriorityToOthersProviderAttitude>(
          builder: (context,provider,child) {
            final data = provider.data;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }

            return Column(
              children: [
               createHeadingText(data.title),
                createAutoSizeText(data.subtitle),
                buildImage(data.image),
                createAutoSizeText(data.subtitle1),
                Column(
                  children: [
                    ImageWithTextCard(imageUrl: data.image1["image"]!, subtitle:  data.image1["text"]!),
                    ImageWithTextCard(imageUrl: data.image2["image"]!, subtitle:  data.image2["text"]!),
                    ImageWithTextCard(imageUrl: data.image3["image"]!, subtitle:  data.image3["text"]!),
                    ImageWithTextCard(imageUrl: data.image4["image"]!, subtitle:  data.image4["text"]!)


                  ],
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Othertype6(), // Replace with your next screen
                      //   ),
                      // );
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
