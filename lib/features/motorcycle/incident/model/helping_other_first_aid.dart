import 'package:flutter/foundation.dart';

class FirstAidData {
  final String image;
  final List<String> image1;
  final List<String> image2;
  final List<String> image3;
  final List<String> image4;
  final List<String> image5;
  final List<String> points;
  final List<String> points1;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;

  FirstAidData({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.points,
    required this.points1,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
  });

  factory FirstAidData.fromMap(Map<String, dynamic> data) {
    return FirstAidData(
      image: data['image'] ?? '',
      image1: List<String>.from(data['image1'] ?? []),
      image2: List<String>.from(data['image2'] ?? []),
      image3: List<String>.from(data['image3'] ?? []),
      image4: List<String>.from(data['image4'] ?? []),
      image5: List<String>.from(data['image5'] ?? []),
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
