// video_repository.dart

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/video_clip_model.dart';

class VideoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetch all videos from the specified collection.
  Future<List<Video>> fetchAllVideos(String collectionName) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();
      log(querySnapshot.docs.length.toString());
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Video.fromMap(data);
      }).toList();
    } catch (e) {
      print('Error fetching videos: $e');
      return [];
    }
  }
}