import 'package:cloud_firestore/cloud_firestore.dart';

class WeatherBadConditions {
  final String image;
  final List<String> points;
  final List<String> points1;
  final String subtitle;
  final String subtitle1;
  final String tip;
  final String title;
  final String title1;

  WeatherBadConditions({
    required this.image,
    required this.points,
    required this.points1,
    required this.subtitle,
    required this.subtitle1,
    required this.tip,
    required this.title,
    required this.title1,
  });

  factory WeatherBadConditions.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return WeatherBadConditions(
      image: data['image'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'points1': points1,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'tip': tip,
      'title': title,
      'title1': title1,
    };
  }
}
