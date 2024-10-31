import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/allertness/pages/think_about.dart';
import 'package:driving_lisence/features/allertness/viewmodel/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeetingStandardAlertness extends StatefulWidget {
  const MeetingStandardAlertness({super.key});

  @override
  State<MeetingStandardAlertness> createState() => _MeetingStandardAlertnessState();
}

class _MeetingStandardAlertnessState extends State<MeetingStandardAlertness> {

  AlertController? _alertController;

  @override
  void didChangeDependencies() {
    _alertController=Provider.of<AlertController>(context,listen: false);
    _alertController?.fetchMeetingStandardAlert();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Meeting the Standard",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Consumer<AlertController>(builder: (BuildContext context, value, Widget? child) {
        final data = value.meetingStandardAlert;
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: createAutoSizeText(data.subtitle),
                ),
                createHeadingText(data.title2),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(data.points1[0]),
                        buildBulletText(data.points1[1]),
                        buildBulletText(data.points1[2]),
                        buildBulletText(data.points1[3]),
                        buildBulletText(data.points1[4]),
                        buildBulletText(data.points1[5]),
                        buildBulletText(data.points1[6]),
                        buildBulletText(data.points1[7]),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: createHeadingText(data.title2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child: Column(
                      children: [
                        buildBulletText(data.points2[0]),
                        buildBulletText(data.points2[1]),
                        buildBulletText(data.points2[2]),
                        buildBulletText(data.points2[3]),

                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThinkAboutAlert()),
                    );
                  },
                  child: Center(
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 30.0),
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
              ],
            ),
          ),
        );
      },),
    );
  }
}
