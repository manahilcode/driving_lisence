// lib/screens/traffic_sign_info_screen.dart
import 'package:driving_lisence/core/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../traffic_Sign_screen.dart';
import '../viewmodel/you_know_traffic_provider.dart';

class TrafficSignInfoScreen extends StatefulWidget {
  const TrafficSignInfoScreen({super.key});

  @override
  State<TrafficSignInfoScreen> createState() => _TrafficSignInfoScreenState();
}

class _TrafficSignInfoScreenState extends State<TrafficSignInfoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_){
      final signProvider = Provider.of<TrafficSignInfoProvider>(context, listen: false);
      signProvider.fetchTrafficSignInfo();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A clean AppBar with a title.
      appBar: CustomAppBar(title: "Traffic Sign Information", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){
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
      //   title: const Text('Traffic Sign Information'),
      // ),
      body: Column(
        children: [
          Consumer<TrafficSignInfoProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: LoadingScreen());
              }
              if (provider.trafficSignInfo == null) {
                return const Center(child: Text("No data available."));
              }
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Text(
                  provider.trafficSignInfo!.text,
                  style: const TextStyle( height: 1.5),

                ),
              );
            },
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
    );
  }
}
