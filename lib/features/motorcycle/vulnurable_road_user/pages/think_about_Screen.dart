import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/think_about_provider.dart';
import 'discussion_practice_trainer_screen.dart';

class ThinkAboutScreenVulnerable extends StatefulWidget {
  const ThinkAboutScreenVulnerable({super.key});

  @override
  State<ThinkAboutScreenVulnerable> createState() => _ThinkAboutScreenVulnerableState();
}

class _ThinkAboutScreenVulnerableState extends State<ThinkAboutScreenVulnerable> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ThinkAboutProviderVal>(context, listen: false);
      provider.fetchDiscussionQuestionsData("Think_about");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "think about", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<ThinkAboutProviderVal>(
          builder: (context,provider,child) {
            final data = provider.data;
            if(data == null)
            {
              return LoadingScreen();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                   createHeadingText(data.title),
                  Gap(10),
                  Column(
                    children: data.points.map((e)=>buildBulletText(e.toString()).animate().fadeIn(duration: 1.seconds),).toList(),
                  ),
                  Gap(20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiscussionPracticeTrainerScreenVulnerable(), // Replace with your next screen
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
            );
          }
      ),
    );
  }
}
