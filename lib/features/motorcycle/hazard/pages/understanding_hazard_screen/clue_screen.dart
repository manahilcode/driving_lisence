import 'dart:developer';

import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../motorcycle_hazard_perception_screen.dart';
import '../../viewmodel/clue_provider.dart';

class ClueScreen extends StatefulWidget {
  const ClueScreen({super.key});

  @override
  State<ClueScreen> createState() => _ClueScreenState();
}

class _ClueScreenState extends State<ClueScreen> {
  late VideoPlayerController _videoPlayerController1;
  bool _isVideo1Initialized = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = Provider.of<CluesProvider>(context, listen: false);
      provider.fetchClue("motorcycle_seeing_hazard", "Clues");

      if (provider.clue != null) {
        final videoUrl1 = provider.clue!.video;
        log(videoUrl1);

        if (videoUrl1.isNotEmpty) {
          _videoPlayerController1 = VideoPlayerController.network(videoUrl1)
            ..initialize().then((_) {
              setState(() {
                _isVideo1Initialized = true;
              });
            })
            ..setLooping(true);
        }
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
          title: "CLue",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<CluesProvider>(builder: (context, provider, child) {
        if(provider.clue == null)
          {
            return Center(
              child: LoadingScreen(),
            );
          }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                createHeadingText(provider.clue?.title ?? ""),
                createAutoSizeText(provider.clue!.subtitle),
                Gap(10),
                createAutoSizeText(provider.clue!.subtitle1),
                Gap(10),
                Column(
                  children: provider.clue!.image.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Add padding around each image
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              8), // Rounded corners for images
                          boxShadow: [
                            BoxShadow(blurRadius: 6, color: Colors.grey)
                          ], // Optional shadow effect
                        ),
                        child:
                            buildImage(e.toString()), // Your image builder function
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: provider.clue!.image1.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Add padding around each image
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              8), // Rounded corners for images
                          boxShadow: [
                            BoxShadow(blurRadius: 6, color: Colors.grey)
                          ], // Optional shadow effect
                        ),
                        child:
                            buildImage(e.toString()), // Your image builder function
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: provider.clue!.image2.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Add padding around each image
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              8), // Rounded corners for images
                          boxShadow: [
                            BoxShadow(blurRadius: 6, color: Colors.grey)
                          ], // Optional shadow effect
                        ),
                        child:
                            buildImage(e.toString()), // Your image builder function
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: provider.clue!.image3.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Add padding around each image
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              8), // Rounded corners for images
                          boxShadow: [
                            BoxShadow(blurRadius: 6, color: Colors.grey)
                          ], // Optional shadow effect
                        ),
                        child:
                            buildImage(e.toString()), // Your image builder function
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: provider.clue!.image4.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Add padding around each image
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              8), // Rounded corners for images
                          boxShadow: [
                            BoxShadow(blurRadius: 6, color: Colors.grey)
                          ], // Optional shadow effect
                        ),
                        child:
                            buildImage(e.toString()), // Your image builder function
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: provider.clue!.image5.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Add padding around each image
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              8), // Rounded corners for images
                          boxShadow: [
                            BoxShadow(blurRadius: 6, color: Colors.grey)
                          ], // Optional shadow effect
                        ),
                        child:
                            buildImage(e.toString()), // Your image builder function
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  children: provider.clue!.image6.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Add padding around each image
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              8), // Rounded corners for images
                          boxShadow: [
                            BoxShadow(blurRadius: 6, color: Colors.grey)
                          ], // Optional shadow effect
                        ),
                        child:
                            buildImage(e.toString()), // Your image builder function
                      ),
                    );
                  }).toList(),
                ),
                Gap(10),
                if (_isVideo1Initialized)
                  AspectRatio(
                    aspectRatio: _videoPlayerController1.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController1),
                  )
                else
                  const Center(child: CircularProgressIndicator()),
                Gap(10),
                GestureDetector(
                  onTap: () {
                    Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

                    Navigator.pushAndRemoveUntil(
                      context,
                      newRoute,
                          (Route<dynamic> route) => false, // Removes all previous routes
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
      }),
    );
  }
}
