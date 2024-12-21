import 'package:cloud_firestore/cloud_firestore.dart';

class HazardousLoad {
  final String image;
  final String image1;
  final String image2;
  final String image3;
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String subtitle4;
  final String tip;
  final String title;
  final String title1;
  final String title2;
  final String title3;

  HazardousLoad({
    required this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
    required this.tip,
    required this.title,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  // Factory constructor to convert Firestore data to model
  factory HazardousLoad.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return HazardousLoad(
      image: data['image'] ?? '',
      image1: data['image1'] ?? '',
      image2: data['image2'] ?? '',
      image3: data['image3'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      subtitle3: data['subtitle3'] ?? '',
      subtitle4: data['subtitle4'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
      title3: data['title3'] ?? '',
    );
  }
}
