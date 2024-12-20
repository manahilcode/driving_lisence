import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/loader.dart';
import '../../../../motorcycle_hazard_perception_screen.dart';
import '../../viewmodel/learning_see_provider.dart';
import '../../viewmodel/scanning_provider.dart';

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
  late VideoPlayerController _videoPlayerController2;
  bool _isVideo1Initialized = false;
  bool _isVideo2Initialized = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = Provider.of<LearningSeeProvider>(context, listen: false);
      provider.fetchModel("motorcycle_seeing_hazard","Learning_to_see_hazards");

      if (provider.hazardModels != null) {
        final videoUrl1 = provider.hazardModels!.video;
        final videoUrl2 = provider.hazardModels!.video1;

        if (videoUrl1.isNotEmpty) {
          _videoPlayerController1 = VideoPlayerController.network(videoUrl1)
            ..initialize().then((_) {
              setState(() {
                _isVideo1Initialized = true;
              });
            })
            ..setLooping(true);
        }

        if (videoUrl2 != null && videoUrl2.isNotEmpty) {
          _videoPlayerController2 = VideoPlayerController.network(videoUrl2)
            ..initialize().then((_) {
              setState(() {
                _isVideo2Initialized = true;
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
    return Scaffold(
      appBar: CustomAppBar(
          title: "Learning to see hazard",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {
            Route newRoute = MaterialPageRoute(builder: (context) => const MotorcycleHazardPerceptionScreen());

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

              Gap(10),

              Gap(10),
              if (_isVideo1Initialized)
                AspectRatio(
                  aspectRatio: _videoPlayerController1.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController1),
                )
              else
                const Center(child: CircularProgressIndicator()),
              Gap(10),
              if (_isVideo2Initialized)
                AspectRatio(
                  aspectRatio: _videoPlayerController2.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController2),
                )
              else
                const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      }),
    );
  }
}
