import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driving_lisence/attitude_practice_Question_screen.dart';
import 'package:driving_lisence/vehicle_safety_5.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Safety4 extends StatefulWidget {
  @override
  _Safety4State createState() => _Safety4State();
}

class _Safety4State extends State<Safety4> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('safety_4');

  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  String? _videoUrl;
  String? _title;

  // Fetch the 'title' and 'video' fields from Firestore
  Future<void> fetchVideoDetails() async {
    try {
      DocumentSnapshot docSnapshot = await collectionReference.doc('safety_4.4').get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        setState(() {
          _title = data['title'];
          _videoUrl = data['video'];
        });
        print('Video URL fetched: $_videoUrl');
        _initializeVideoPlayer();
      } else {
        setState(() {
          _title = 'No title available';
          _videoUrl = null;
        });
      }
    } catch (e) {
      print('Error fetching video details: $e');
      setState(() {
        _title = 'Error fetching title';
        _videoUrl = null;
      });
    }
  }

  // Initialize the video player after fetching the video URL
  Future<void> _initializeVideoPlayer() async {
    if (_videoUrl != null) {
      _controller = VideoPlayerController.network(_videoUrl!)
        ..initialize().then((_) {
          setState(() {
            _isVideoInitialized = true;
          });
          _controller.play();
        }).catchError((error) {
          print('Error initializing video player: $error');
        });
    } else {
      print('No valid video URL found.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchVideoDetails(); // Fetch video details on initialization
  }

  @override
  void dispose() {
    if (_isVideoInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Pro Tip',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Looking after your car",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              // Display the title fetched from Firestore
              Text(
                _title ?? 'No title',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              // Display video player with play/pause button
              _isVideoInitialized
                  ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  _PlayPauseOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              )
                  : Text('Video not available or loading...'),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Safety_5()),
                  );
                },
                child: Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
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
                  child: Center(
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
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  final VideoPlayerController controller;

  const _PlayPauseOverlay({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.value.isPlaying ? controller.pause() : controller.play();
      },
      child: Stack(
        children: [
          Container(
            color: Colors.black38,
            child: Center(
              child: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
