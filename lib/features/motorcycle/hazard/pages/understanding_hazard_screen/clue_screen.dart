import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

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
      if (provider.clue != null) {
        final videoUrl1 = provider.clue!.video;

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
        return Column(
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
          ],
        );
      }),
    );
  }
}
