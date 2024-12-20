import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/loader.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

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
              
            ],
          );
        }
      ),
    );
  }
}
