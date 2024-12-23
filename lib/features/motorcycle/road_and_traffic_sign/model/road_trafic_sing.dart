import 'package:flutter/foundation.dart';

class RoadSignsDataSign {
  final String image;
  final List<String> points;
  final String title;

  RoadSignsDataSign({
    required this.image,
    required this.points,
    required this.title,
  });

  factory RoadSignsDataSign.fromJson(Map<String, dynamic> json) {
    return RoadSignsDataSign(
      image: json['image'] ?? '',
      points: List<String>.from(json['points']),
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'points': points,
      'title': title,
    };
  }
}
