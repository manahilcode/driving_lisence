import 'package:flutter/foundation.dart';

class RoadLanesData {
  final String image;
  final String image1;
  final List<String> points;
  final String subtitle;
  final String title;

  RoadLanesData({
    required this.image,
    required this.image1,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory RoadLanesData.fromJson(Map<String, dynamic> json) {
    return RoadLanesData(
      image: json['image'] ?? '',
      image1: json['image1'] ?? '',
      points: List<String>.from(json['points']),
      subtitle: json['subtitle'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'image1': image1,
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
