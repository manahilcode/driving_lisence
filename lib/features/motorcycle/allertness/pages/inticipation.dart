import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/allertness/pages/stay_focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/imagewithtext.dart';
import '../../../../core/loader.dart';
import '../viewmodel/anticipation_provider.dart';
import '../viewmodel/distraction_provider.dart';

class InticipationScreen extends StatefulWidget {
  const InticipationScreen({super.key});

  @override
  State<InticipationScreen> createState() => _InticipationScreenState();
}

class _InticipationScreenState extends State<InticipationScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider =
      Provider.of<AnticipationProvider>(context, listen: false);
      provider.fetchRoadAwarenessData("motorcycle_alertness", "Anticipation");
      //  provider.fetchAllDocuments("motorcycle_alertness");
    });
    //motorcycle_alertness
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
          title: "Anticipation",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<AnticipationProvider>(builder: (context, provider, child) {
        final data = provider.data;
        print(data);
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
                buildImage(data.image),
                createHeadingText(data.title1),
                createAutoSizeText(data.subtitle1),
                Column(
                  children: data.points
                      .map((e) => buildBulletText(e.toString()))
                      .toList(),
                ),
                createHeadingText(data.title2),
                createAutoSizeText(data.subtitle2),
                createAutoSizeText(data.subtitle3),
                Column(
                  children: [
                    createHeadingText(data.definitions.title),
                    createAutoSizeText(data.definitions.subtitle),
                 //   buildImage(data.definitions.image),
                    createHeadingText(data.definitions.title1),
                    createAutoSizeText(data.definitions.subtitle1),
                  ],
                ),
                Column(
                  children: data.points1
                      .map((e) => buildBulletText(e.toString()))
                      .toList(),
                ),
                Column(
                  children: [
                    ImageWithTextCard(
                      imageUrl: '${data.imageItems[0].image}',
                      subtitle: '${data.imageItems[0].text}',
                    ),
                    ImageWithTextCard(
                        imageUrl: '${data.imageItems[1].image}',
                        subtitle: '${data.imageItems[1].text}'),
                    ImageWithTextCard(
                        imageUrl: '${data.imageItems[2].image}',
                        subtitle: '${data.imageItems[2].text}'),
                  ],
                ),
                Gap(10),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StayFocusScreen(), // Replace with your next screen
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
      }),
    );
  }
}
