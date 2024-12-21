import 'package:cloud_firestore/cloud_firestore.dart';

class PedestrianCrossingVul {
  final List<String> image;
  final List<String> image1;
  final List<String> image2;
  final String subtitle;
  final String tip;
  final List<String> tip1;
  final String title;
  final String title1;

  PedestrianCrossingVul({
    required this.image,
    required this.image1,
    required this.image2,
    required this.subtitle,
    required this.tip,
    required this.tip1,
    required this.title,
    required this.title1,
  });

  // Factory constructor to convert Firestore data to model
  factory PedestrianCrossingVul.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return PedestrianCrossingVul(
      image: List<String>.from(data['image'] ?? []),
      image1: List<String>.from(data['image1'] ?? []),
      image2: List<String>.from(data['image2'] ?? []),
      subtitle: data['subtitle'] ?? '',
      tip: data['tip'] ?? '',
      tip1: List<String>.from(data['tip1'] ?? []),
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
    );
  }
}
