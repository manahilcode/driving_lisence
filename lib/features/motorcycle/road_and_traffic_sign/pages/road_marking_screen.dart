import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/appbar.dart';
import '../../../../core/loader.dart';
import '../viewmodel/road_marking.dart';

class RoadMarkingScreen extends StatefulWidget {
  const RoadMarkingScreen({super.key});

  @override
  State<RoadMarkingScreen> createState() => _RoadMarkingScreenState();
}

class _RoadMarkingScreenState extends State<RoadMarkingScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<BreakdownProvider>(context, listen: false);
      provider.fetchBreakdown("Animals_on_the_road");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "", leadingIcon: Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<RoadMarkingsNotifier>(
          builder: (context,provider,child) {
            final data = provider!.roadMarkingsData;
            if (data == null) {
              return const Center(
                child: LoadingScreen(),
              );
            }
            return Column(
              children: [
                    createHeadingText(data.title),
                createAutoSizeText(data.subtitle),
                createAutoSizeText(data.subtitle1),
                Column(
                  children: data.image.map((e)=>buildImage(e.toString())).toList(),
                ),
                Column(
                  children: data.image1.map((e)=>buildImage(e.toString())).toList(),
                ),
                Column(
                  children: data.image2.map((e)=>buildImage(e.toString())).toList(),
                ),
                Column(
                  children: data.image3.map((e)=>buildImage(e.toString())).toList(),
                ),
                Column(
                  children: data.image4.map((e)=>buildImage(e.toString())).toList(),
                ),
                Column(
                  children: data.image5.map((e)=>buildImage(e.toString())).toList(),
                ),
                Column(
                  children: data.image6.map((e)=>buildImage(e.toString())).toList(),
                ),
                Column(
                  children: data.image7.map((e)=>buildImage(e.toString())).toList(),
                ),
                Column(
                  children: data.image8.map((e)=>buildImage(e.toString())).toList(),
                ),
                Column(
                  children: data.image9.map((e)=>buildImage(e.toString())).toList(),
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
