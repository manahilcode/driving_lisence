import 'dart:developer';

import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/loader.dart';
import '../../../../motorcycle_hazard_perception_screen.dart';
import '../../viewmodel/learning_see_provider.dart';

class LearningToSeeHazard extends StatefulWidget {
  const LearningToSeeHazard({super.key});

  @override
  State<LearningToSeeHazard> createState() => _LearningToSeeHazardState();
}

class _LearningToSeeHazardState extends State<LearningToSeeHazard> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;

  late VideoPlayerController _videoPlayerController1;

  bool _isVideo1Initialized = false;

  Future<void> _loadVideo(String url, int videoNumber) async {
    if (url.isEmpty) return;

    try {
      final file = await DefaultCacheManager().getSingleFile(url);
      if (file != null) {
        final videoPlayerController = VideoPlayerController.file(file);
        await videoPlayerController.initialize();
        setState(() {
          if (videoNumber == 1) {
            _videoPlayerController1 = videoPlayerController;
            _isVideo1Initialized = true;
          }
        });
        videoPlayerController.setLooping(true);
      } else {
        // Handle the case where the file couldn't be retrieved from the cache or network
        print('Failed to load video from cache or network: $url');
      }
    } catch (e) {
      print('Error loading video: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final provider = Provider.of<LearningSeeProvider>(context, listen: false);
      await provider.fetchModel(
          "motorcycle_seeing_hazard", "Learning_to_see_hazards");
      final videoUrl1 = provider.hazardModels!.video;
      log(videoUrl1);

      if (videoUrl1.isNotEmpty) {
        _loadVideo(videoUrl1, 1);
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
          title: "Learning to see hazard",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {
            Route newRoute = MaterialPageRoute(
                builder: (context) => const MotorcycleHazardPerceptionScreen());

            Navigator.pushAndRemoveUntil(
              context,
              newRoute,
              (Route<dynamic> route) => false, // Removes all previous routes
            );
          }),
      body: Consumer<LearningSeeProvider>(builder: (context, provider, child) {
        final data = provider.hazardModels;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              createHeadingText(data.title),
              createAutoSizeText(data.subtitle),
              Gap(20),
              if (_isVideo1Initialized)


                AspectRatio(
                  aspectRatio: _videoPlayerController1.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController1),
                )
              else
                const Center(
                    child: SpinKitPouringHourGlass(color: Colors.green)),
              Gap(20),
              GestureDetector(
                onTap: () {
                  Route newRoute = MaterialPageRoute(
                      builder: (context) =>
                          const MotorcycleHazardPerceptionScreen());

                  Navigator.pushAndRemoveUntil(
                    context,
                    newRoute,
                    (Route<dynamic> route) =>
                        false, // Removes all previous routes
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
        );
      }),
    );
  }
}
