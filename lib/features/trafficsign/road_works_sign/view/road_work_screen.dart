// lib/screens/road_work_sign_screen.dart
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../../../../traffic_Sign_screen.dart';
import '../viewmodel/road_work_provider.dart';

class RoadWorkSignScreen extends StatefulWidget {
  const RoadWorkSignScreen({Key? key}) : super(key: key);

  @override
  State<RoadWorkSignScreen> createState() => _RoadWorkSignScreenState();
}

class _RoadWorkSignScreenState extends State<RoadWorkSignScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_){
      final signProvider = Provider.of<RoadWorkSignProvider>(context, listen: false);
      signProvider.fetchRoadWorkSign();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Road Work Signs", leadingIcon: Icons.arrow_back, onLeadingIconPressed: (){
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
      //   title: const Text('Road Work Signs'),
      // ),
      body: Consumer<RoadWorkSignProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: LoadingScreen());
          }
          if (provider.roadWorkSign == null) {
            return const Center(child: Text("No data available."));
          }
          final roadWorkSign = provider.roadWorkSign!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: roadWorkSign.items.length,
                    itemBuilder: (context, index) {
                      final item = roadWorkSign.items[index];
                         return Column(
                           children: [
                             Gap(10),
                             createAutoSizeText(
                               item.title,

                             ),
                             Gap(10),
                             Image.network(
                               item.imageUrl,
                               width: 70,
                               height: 70,
                               fit: BoxFit.cover,
                               errorBuilder: (context, error, stackTrace) {
                                 return Container(
                                   width: 70,
                                   height: 70,
                                   color: Colors.grey[300],
                                   child: const Icon(Icons.image_not_supported),
                                 );
                               },
                             ),


                           ],

                      );
                    },
                  ),
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
        },
      ),
    );
  }
}
