import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/pedestrain_crossing_provider.dart';

class PedestrainCrossingScreen extends StatefulWidget {
  const PedestrainCrossingScreen({super.key});

  @override
  State<PedestrainCrossingScreen> createState() => _PedestrainCrossingScreenState();
}

class _PedestrainCrossingScreenState extends State<PedestrainCrossingScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<PedestrianCrossingProvider>(context, listen: false);
      provider.fetchPedestrianCrossingData("Animals_on_the_road");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "pedestrian crossing", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),

      body: Consumer<PedestrianCrossingProvider>(
          builder: (context,provider,child) {
            final data = provider.data;
            if(data == null)
            {
              return LoadingScreen();
            }
            return Column(
              children: [
createHeadingText(data.title),
                createAutoSizeText(data.subtitle),
                createAutoSizeText(data.title1),
                Column(
                  children:[
                    createAutoSizeText(data.image[0]),
                    buildImage(data.image[1]),
                  ]
                ),

                Column(
                    children:[
                      createAutoSizeText(data.image1[0]),
                      buildImage(data.image1[1]),
                    ]
                ),
                Column(
                    children:[
                      createAutoSizeText(data.image2[0]),
                      buildImage(data.image2[1]),
                    ]
                ),

                Column(
                  children: data.tip1.map((e)=>buildBulletText(e.toString())).toList(),
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
          }
      ),
    );
  }
}
