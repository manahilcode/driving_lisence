import 'package:cloud_firestore/cloud_firestore.dart';

class MotorcycleControlInfo {
  final String image;
  final String image1;
  final String image2;
  final String image3;
  final List<String> points;
  final List<String> points1;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String subtitle4;
  final String subtitle5;
  final String title;

  MotorcycleControlInfo({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.points,
    required this.points1,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.subtitle5,
    required this.title,
  });

  factory MotorcycleControlInfo.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MotorcycleControlInfo(
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      image3: data['image3'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      subtitle3: data['subtitle3'] ?? '',
      subtitle4: data['subtitle4'] ?? '',
      subtitle5: data['subtitle5'] ?? '',
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'points': points,
      'points1': points1,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'subtitle3': subtitle3,
      'subtitle4': subtitle4,
      'subtitle5': subtitle5,
      'title': title,
    };
  }
}
