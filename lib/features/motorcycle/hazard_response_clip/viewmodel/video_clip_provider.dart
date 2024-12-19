// video_provider.dart

import 'package:flutter/material.dart';

import '../model/video_clip_model.dart';
import '../repo/video_clip_repo.dart';

class VideoProvider extends ChangeNotifier {
  final VideoRepository _repository = VideoRepository();
  List<Video> _videos = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Video> get videos => _videos;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  /// Fetch all videos from the repository.
  Future<void> fetchAllVideos(String collectionName) async {
    _isLoading = true;
    notifyListeners();

    try {
      _videos = await _repository.fetchAllVideos(collectionName);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = 'Failed to fetch videos: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}