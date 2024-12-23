import 'package:cloud_firestore/cloud_firestore.dart';

class TrafficLightsWarning {
  final String image;
  final List<String> image1;
  final List<String> image2;
  final List<String> image3;
  final List<String> image4;
  final List<String> points;
  final String subtitle;
  final String title;

  TrafficLightsWarning({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.points,
    required this.subtitle,
    required this.title,
  });

  factory TrafficLightsWarning.fromJson(Map<String, dynamic> json) {
    return TrafficLightsWarning(
      image: json['image'] as String,
      image1: List<String>.from(json['image1'] as List),
      image2: List<String>.from(json['image2'] as List),
      image3: List<String>.from(json['image3'] as List),
      image4: List<String>.from(json['image4'] as List),
      points: List<String>.from(json['points'] as List),
      subtitle: json['subtitle'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'points': points,
      'subtitle': subtitle,
      'title': title,
    };
  }
}
