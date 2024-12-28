import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/motorcycle/incident/pages/reporting_an_incident.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/helping_other_first_aid.dart';

class HelpingOtherScreen extends StatefulWidget {
  const HelpingOtherScreen({super.key});

  @override
  State<HelpingOtherScreen> createState() => _HelpingOtherScreenState();
}

class _HelpingOtherScreenState extends State<HelpingOtherScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<FirstAidProvider>(context, listen: false);
      provider.loadFirstAidData("Helping_others_and_giving_first_aid");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Helping Other",
        leadingIcon: Icons.arrow_back,
        onLeadingIconPressed: () {},
      ),
      body: Consumer<FirstAidProvider>(builder: (context, provider, child) {
        final data = provider.firstAidData;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }
        return Column(
          children: [
            createHeadingText(data.tip),
            createAutoSizeText(data.subtitle),
            buildImage(data.image),
            buildTipWidget(data.tip),
            createAutoSizeText(data.subtitle1),
            Column(
              children: data.points
                  .map((e) => buildBulletText(e.toString()))
                  .toList(),
            ),
            Column(
              children: data.points1
                  .map((e) => buildBulletText(e.toString()))
                  .toList(),
            ),
            Column(
              children: [
                createAutoSizeText(data.image1[0]),
                createAutoSizeText(data.image1[1]),
                buildImage(data.image1[2]),
              ],
            ),
            Column(
              children: [
                createAutoSizeText(data.image2[0]),
                createAutoSizeText(data.image2[1]),
                buildImage(data.image2[2]),
              ],
            ),
            Column(
              children: [
                createAutoSizeText(data.image3[0]),
                createAutoSizeText(data.image3[1]),
                buildImage(data.image3[2]),
              ],
            ),
            Column(
              children: [
                createAutoSizeText(data.image4[0]),
                createAutoSizeText(data.image4[1]),
                buildImage(data.image4[2]),
              ],
            ),
            Column(
              children: [
                createAutoSizeText(data.image5[0]),
                createAutoSizeText(data.image5[1]),
                buildImage(data.image5[2]),
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to the next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportingAnIncidentScreen(), // Replace with your next screen
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
      }),
    );
  }
}
