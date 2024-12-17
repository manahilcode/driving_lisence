import 'package:driving_lisence/core/appbar.dart';
import 'package:driving_lisence/core/sharedUi.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/loader.dart';
import '../../viewmodel/scanning_provider.dart';

class ScanningScreen extends StatefulWidget {
  const ScanningScreen({super.key});

  @override
  State<ScanningScreen> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {
  int? selectedAnswerIndex;
  bool isCorrect = false;
  bool isSelect = false;
  late VideoPlayerController _videoController1;
  late VideoPlayerController _videoController2;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ScanningProvider>(context, listen: false);
    _videoController1 = VideoPlayerController.network(
      'https://www.example.com/video1.mp4', // Replace with your video URL
    )..initialize().then((_) {
      setState(() {}); // Refresh when video is ready
    });

    _videoController2 = VideoPlayerController.network(
      'https://www.example.com/video2.mp4', // Replace with your video URL
    )..initialize().then((_) {
      setState(() {}); // Refresh when video is ready
    });
  }
  @override
  void dispose() {
    // Dispose video controllers
    _videoController1.dispose();
    _videoController2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Scanning",
          leadingIcon: Icons.arrow_back,
          onLeadingIconPressed: () {}),
      body: Consumer<ScanningProvider>(builder: (context, provider, child) {
        final data = provider.scanningModel;
        if (data == null) {
          return const Center(
            child: LoadingScreen(),
          );
        }
        final ans = data.answers;
        final correctAnswer = data.correct;

        return Column(
          children: [
            createHeadingText(data.title),
            createAutoSizeText(data.subtitle),
            createHeadingText(data.subtitle1),
            createAutoSizeText(data.subtitle2),
            Gap(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.points
                      .map((point) =>
                          buildBulletText(point)) // Map each point to a widget
                      .toList(), // Convert the Iterable to a List<Widget>
                ),
              ),
            ),
            Gap(10),
            createAutoSizeText(data.text),
            Gap(10),
            createAutoSizeText(data.question),
            Gap(10),
            Column(
              children: ans.asMap().entries.map((entry) {
                int answerIndex = entry.key; // Index of the current answer
                String answerText = entry.value; // The actual answer text

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    child: ListTile(
                      tileColor: selectedAnswerIndex != null
                          ? answerText == correctAnswer
                              ? Colors.green.withOpacity(0.7)
                              : selectedAnswerIndex == answerIndex
                                  ? Colors.red.withOpacity(0.7)
                                  : null
                          : null,
                      leading: Text(
                          (answerIndex + 1).toString()), // Display index + 1
                      title: Text(answerText), // Display the answer text
                      trailing: selectedAnswerIndex != null
                          ? answerText == correctAnswer
                              ? Icon(Icons.check,
                                  color: Colors.green) // Correct answer
                              : selectedAnswerIndex == answerIndex
                                  ? Icon(Icons.close,
                                      color: Colors.red) // Wrong answer
                                  : null
                          : null,
                      onTap: selectedAnswerIndex == null
                          ? () {
                              setState(() {
                                selectedAnswerIndex = answerIndex;
                                isCorrect = answerText == correctAnswer;
                                isSelect = true;
                              });
                            }
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            Gap(10),
            createAutoSizeText(data.info),
            Column(
              children: [
                buildImage(data.image1),
                buildImage(data.image2),
                buildImage(data.image3),
              ],
            ),
            if (_videoController1.value.isInitialized)
              Column(
                children: [
                  AspectRatio(
                    aspectRatio: _videoController1.value.aspectRatio,
                    child: VideoPlayer(_videoController1),
                  ),
                  IconButton(
                    icon: Icon(
                      _videoController1.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(() {
                        _videoController1.value.isPlaying
                            ? _videoController1.pause()
                            : _videoController1.play();
                      });
                    },
                  ),
                ],
              ),
            Gap(10),
            // video 2 show
            if (_videoController2.value.isInitialized)
              Column(
                children: [
                  AspectRatio(
                    aspectRatio: _videoController2.value.aspectRatio,
                    child: VideoPlayer(_videoController2),
                  ),
                  IconButton(
                    icon: Icon(
                      _videoController2.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(() {
                        _videoController2.value.isPlaying
                            ? _videoController2.pause()
                            : _videoController2.play();
                      });
                    },
                  ),
                ],
              ),

          ],
        );
      },
      ),
    );
  }
}
