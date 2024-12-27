import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../Rule_of_road/pages/meeting_standard_screen.dart';
import '../viewmodel/being_seen_by_other_provider.dart';
import 'meeting_standard.dart';

class BeingSeenOtherScreen extends StatefulWidget {
  const BeingSeenOtherScreen({super.key});

  @override
  State<BeingSeenOtherScreen> createState() => _BeingSeenOtherScreenState();
}

class _BeingSeenOtherScreenState extends State<BeingSeenOtherScreen> {
  @override
  void initState() {
    // TODO: implement initState
    //Being_seen_by_others
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BeingSeenProvider>(context, listen: false);
      provider.fetchBeingSeenData("motorcycle_alertness", "Being_seen_by_others");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "Being Seen by Others", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){}),

      body: Consumer<BeingSeenProvider>(
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
                  buildImage(data.image),
                  createAutoSizeText(data.selfReflection),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTipWidget(data.tip),
                  ),
                  createAutoSizeText(data.subtitle1),
                  Column(
                    children: data.points.map((e)=>buildBulletText(e.toString())).toList(),
                  ),
                 Gap(10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MeetingStandardScreenAllert(), // Replace with your next screen
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
