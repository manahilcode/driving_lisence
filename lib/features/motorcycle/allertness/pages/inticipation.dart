import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Alertness",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<AnticipationProvider>(builder: (context, provider, child) {
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
                createAutoSizeText(data.definitions[0].title),
                createAutoSizeText(data.definitions[0].subtitle),
                buildImage(data.definitions[0].image),
                createAutoSizeText(data.definitions[0].title1),
                createAutoSizeText(data.definitions[0].subtitle1),
              ],
            ),
            Column(
              children: data.points1
                  .map((e) => buildBulletText(e.toString()))
                  .toList(),
            ),
            Column(children: [
              ImageWithTextCard(
                imageUrl: '${data.imageItems[0].image}',
                subtitle: '${data.imageItems[0].image}',
              ),
              ImageWithTextCard(
                  imageUrl: '${data.imageItems[1].image}',
                  subtitle: '${data.imageItems[1].image}'),
              ImageWithTextCard(
                  imageUrl: '${data.imageItems[2].image}',
                  subtitle: '${data.imageItems[2].image}'),
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
      }),
    );
  }
}
