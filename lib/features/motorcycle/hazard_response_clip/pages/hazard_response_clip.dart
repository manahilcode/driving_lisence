import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../motorcycle_hazard_perception_screen.dart';
import '../model/video_clip_model.dart';
import '../viewmodel/video_clip_provider.dart';

class VideoShowPageView extends StatefulWidget {
  const VideoShowPageView({super.key});

  @override
  _VideoShowPageViewState createState() => _VideoShowPageViewState();
}

class _VideoShowPageViewState extends State<VideoShowPageView> {
  final PageController _pageController = PageController();
  VideoPlayerController? _controller;  // Make this nullable to handle the case when no video is initialized yet
  Future<void>? _initializeVideoPlayerFuture;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Fetch videos after the widget is built
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<VideoProvider>(context, listen: false);
      provider.fetchAllVideos('motorcycle_response_clip');
    });
  }

  // This method initializes the video player for the selected index
  void _initializeVideoForIndex(int index, VideoProvider provider) {
    final videos = provider.videos;
    if (videos != null && videos.isNotEmpty) {
      final video = videos[index];
      _controller = VideoPlayerController.network(video.url);
      _initializeVideoPlayerFuture = _controller?.initialize().then((_) {
        setState(() {
          _controller?.play(); // Start the video when initialized
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Response clip'),

        leading: IconButton(
          onPressed: () {
            Route newRoute = MaterialPageRoute(
                builder: (context) =>
                const MotorcycleHazardPerceptionScreen());

            Navigator.pushAndRemoveUntil(
              context,
              newRoute,
                  (Route<dynamic> route) => false, // Removes all previous routes
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Consumer<VideoProvider>(
        builder: (context, provider, child) {
          final data = provider.videos;

          // Show loading spinner if data is still loading
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          // Show error message if there's an error
          if (provider.errorMessage.isNotEmpty) {
            return Center(child: Text(provider.errorMessage));
          }

          // If no videos are available, show a message
          if (data == null || data.isEmpty) {
            return Center(child: Text('No videos available.'));
          }

          // Initialize the video player when data is available
          if (_controller == null) {
            _initializeVideoForIndex(_currentIndex, provider);
          }

          return Column(
            children: [
              // Video player widget that displays the video
              AspectRatio(
                aspectRatio: 16 / 9,
                child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return VideoPlayer(_controller!);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Go to the next video if possible
                  if (_currentIndex < data.length - 1) {
                    setState(() {
                      _currentIndex++;
                      _controller?.dispose();  // Dispose of the old controller
                      _initializeVideoForIndex(_currentIndex, provider);  // Initialize the next video
                    });
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();  // Ensure the controller is properly disposed
    super.dispose();
  }
}
