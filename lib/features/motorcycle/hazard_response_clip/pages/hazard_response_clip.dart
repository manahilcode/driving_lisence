import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../model/video_clip_model.dart';
import '../viewmodel/video_clip_provider.dart'; // Import video player package

class VideoPageView extends StatefulWidget {
  const VideoPageView({super.key});

  @override
  _VideoPageViewState createState() => _VideoPageViewState();
}

class _VideoPageViewState extends State<VideoPageView> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Fetch all videos when the screen is initialized
    final provider = Provider.of<VideoProvider>(context, listen: false);
    provider.fetchAllVideos('your_collection_name'); // Replace with your actual collection name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Consumer<VideoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator()); // Show loading indicator
          }

          if (provider.errorMessage.isNotEmpty) {
            return Center(child: Text(provider.errorMessage)); // Show error message
          }

          if (provider.videos.isEmpty) {
            return Center(child: Text('No videos available.')); // Show message if no videos
          }

          return PageView.builder(
            controller: _pageController,
            itemCount: provider.videos.length,
            itemBuilder: (context, index) {
              Video video = provider.videos[index];
              return VideoPlayerWidget(video: video);
            },
          );
        },
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final Video video;

  const VideoPlayerWidget({Key? key, required this.video}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video.url)
      ..initialize().then((_) {
        setState(() {}); // Update the UI when the video is initialized
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(_controller),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(widget.video.info), // Display additional info
        // ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }
}