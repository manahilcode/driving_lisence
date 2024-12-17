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

  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController _videoPlayerController2;
  bool _isVideo1Initialized = false;
  bool _isVideo2Initialized = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = Provider.of<ScanningProvider>(context, listen: false);
      if (provider.scanningModel != null) {
        final videoUrl1 = provider.scanningModel!.video;
        final videoUrl2 = provider.scanningModel!.video2;

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

        return SingleChildScrollView(
          child: Column(
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
                        .map((point) => buildBulletText(point))
                        .toList(),
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
                  int answerIndex = entry.key;
                  String answerText = entry.value;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
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
                        leading: Text((answerIndex + 1).toString()),
                        title: Text(answerText),
                        trailing: selectedAnswerIndex != null
                            ? answerText == correctAnswer
                                ? Icon(Icons.check, color: Colors.green)
                                : selectedAnswerIndex == answerIndex
                                    ? Icon(Icons.close, color: Colors.red)
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
