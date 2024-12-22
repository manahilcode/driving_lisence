import 'package:cloud_firestore/cloud_firestore.dart';

class WeatherConditionsHandling {
  final String image;
  final List<String> points;
  final String subtitle;
  final String title;
  final String title1;

  WeatherConditionsHandling({
    required this.image,
    required this.points,
    required this.subtitle,
    required this.title,
    required this.title1,
  });

  factory WeatherConditionsHandling.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return WeatherConditionsHandling(
      image: data['image'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] ?? '',
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'points': points,
      'subtitle': subtitle,
      'title': title,
      'title1': title1,
    };
  }
}
