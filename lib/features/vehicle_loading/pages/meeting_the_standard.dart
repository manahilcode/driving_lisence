import 'package:driving_lisence/core/sharedUi.dart';
import 'package:driving_lisence/features/vehicle_loading/pages/think_about.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../core/loader.dart';
import '../viewmodel/controller.dart';
import 'discuss_paractice_instructor.dart';
class MeetingstandardVehicleloading extends StatefulWidget {
  const MeetingstandardVehicleloading({super.key});

  @override
  State<MeetingstandardVehicleloading> createState() => _MeetingstandardVehicleloadingState();
}

class _MeetingstandardVehicleloadingState extends State<MeetingstandardVehicleloading> {
  VehicleLoadingProvider? _loadingProvider;
  @override
  void didChangeDependencies() {
    _loadingProvider = Provider.of<VehicleLoadingProvider>(context,listen: false);
    _loadingProvider?.fetchMeetingStandardVehicleLoading();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meeting Standard",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Consumer<VehicleLoadingProvider>(builder: (BuildContext context, value, Widget? child) {
        final data = value.meetingStandardVehicleLoading;

        if(data == null)
        {
          return Center(child: LoadingScreen(),);
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(data.title),
                Gap(10),
                Align(
                  alignment: Alignment.topLeft,
                    child: createHeadingText(data.title2)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
          
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child:
                    Column(
                      children: [
                        buildBulletText(data.points[0]),
                        buildBulletText(data.points[1]),
                        buildBulletText(data.points[2]),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: createHeadingText(data.title3)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green),
                    ),
                    child:
                    Column(
                      children: [
                        buildBulletText(data.points2[0]),
                        buildBulletText(data.points2[1]),
                        buildBulletText(data.points2[2]),
                        buildBulletText(data.points2[3]),
                        buildBulletText(data.points2[4]),
                        buildBulletText(data.points2[5]),
                        buildBulletText(data.points2[6]),
                        buildBulletText(data.points2[7]),
          
          
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DiscussParacticeInstructorVehicleLoading()),
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
                            offset: Offset(0, 3),
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
      },
      ),
    );
  }
}
