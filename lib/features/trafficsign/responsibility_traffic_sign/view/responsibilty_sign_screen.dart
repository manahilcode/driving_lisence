// lib/screens/responsibility_for_traffic_signs_screen.dart
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../../../traffic_Sign_screen.dart';
import '../viewmodel/responsibilty_sign_provider.dart';

class ResponsibilityForTrafficSignsScreen extends StatefulWidget {
  const ResponsibilityForTrafficSignsScreen({Key? key}) : super(key: key);

  @override
  State<ResponsibilityForTrafficSignsScreen> createState() => _ResponsibilityForTrafficSignsScreenState();
}

class _ResponsibilityForTrafficSignsScreenState extends State<ResponsibilityForTrafficSignsScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_){
      final signProvider = Provider.of<ResponsibilityForTrafficSignsProvider>(context, listen: false);
      signProvider.fetchResponsibilityForTrafficSigns();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Responsibility for Traffic Signs", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => TrafficSignScreenMain(),
          ),
              (Route<dynamic> route) =>
          false, // Removes all previous routes
        );
      }),

      // appBar: AppBar(
      //   title: const Text('Responsibility for Traffic Signs'),
      // ),
      body: Consumer<ResponsibilityForTrafficSignsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: LoadingScreen());
          }
          if (provider.data == null) {
            return const Center(child: Text("No data found."));
          }

          final data = provider.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display the main text.
                  Text(
                    data.text,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  // Display the list of points.
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.points.length,
                    separatorBuilder: (context, index) =>  Container(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          buildBulletText(
                            data.points[index],

                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // Display additional text sections.
                  Text(
                    data.text1,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data.text2,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        //   Navigate to the next tip or page
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TrafficSignScreenMain(),
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
        },
      ),
    );
  }
}
