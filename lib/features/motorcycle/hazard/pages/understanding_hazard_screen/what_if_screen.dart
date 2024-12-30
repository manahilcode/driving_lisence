import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../motorcycle_hazard_perception_screen.dart';
import '../../viewmodel/what_if_provider.dart';

class WhatIfScreen extends StatefulWidget {
  const WhatIfScreen({super.key});

  @override
  State<WhatIfScreen> createState() => _WhatIfScreenState();
}

class _WhatIfScreenState extends State<WhatIfScreen> {
  bool _isVideo1Initialized = false;
  late VideoPlayerController _videoPlayerController1;
  bool _isVideo1Initialized1 = false;
  late VideoPlayerController _videoPlayerController2;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = Provider.of<WhatIfProvider>(context, listen: false);
      provider.fetchModel("motorcycle_seeing_hazard", "What_if");
      if (provider.whatIfModels != null) {
        final videoUrl1 = provider.whatIfModels[0].video;
        final videoUrl2 = provider.whatIfModels[0].video1;

        if (videoUrl1.isNotEmpty) {
          _videoPlayerController1 = VideoPlayerController.network(videoUrl1)
            ..initialize().then((_) {
              setState(() {
                _isVideo1Initialized = true;
              });
            })
            ..setLooping(true);
        }

        if (videoUrl2.isNotEmpty) {
          _videoPlayerController2 = VideoPlayerController.network(videoUrl2)
            ..initialize().then((_) {
              setState(() {
                _isVideo1Initialized1 = true;
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
    _videoPlayerController2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "What-if", leadingIcon:Icons.arrow_back, onLeadingIconPressed:(){}),
      body: Consumer<WhatIfProvider>(
        builder: (context,provider,child) {
          final data = provider.whatIfModels;
          if(data != null)
            {
              return Center(
                child: LoadingScreen(),
              );

            }
          return Column(
            children: [
              createHeadingText(data[0].title),
              Gap(10),
              createAutoSizeText(data[0].subtitle),
              Gap(10),
              createAutoSizeText(data[0].subtitle1),
              Gap(10),
              if (_isVideo1Initialized)
                AspectRatio(
                  aspectRatio: _videoPlayerController1.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController1),
                )
              else
                const Center(child: CircularProgressIndicator()),
              Gap(10),
              if (_isVideo1Initialized1)
                AspectRatio(
                  aspectRatio: _videoPlayerController2.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController2),
                )
              else
                const Center(child: CircularProgressIndicator()),
              Gap(10),
              createAutoSizeText(data[0].subtitle2),

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
          );
        }
      ),
    );
  }
}
