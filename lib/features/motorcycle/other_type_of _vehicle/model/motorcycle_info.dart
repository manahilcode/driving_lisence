import 'package:cloud_firestore/cloud_firestore.dart';

class MotorcycleInfo1 {
  final String image;
  final String subtitle;
  final String subtitle1;
  final List<String> tips;
  final String title;

  MotorcycleInfo1({
    required this.image,
    required this.subtitle,
    required this.subtitle1,
    required this.tips,
    required this.title,
  });

  factory MotorcycleInfo1.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MotorcycleInfo1(
      image: data['image'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      tips: List<String>.from(data['tip'] ?? []),
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'tip': tips,
      'title': title,
    };
  }
}
