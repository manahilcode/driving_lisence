import 'package:cloud_firestore/cloud_firestore.dart';

class TrafficCalmingHandling {
  final String image;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String tip;
  final String title;

  TrafficCalmingHandling({
    required this.image,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.tip,
    required this.title,
  });

  factory TrafficCalmingHandling.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return TrafficCalmingHandling(
      image: data['image'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'subtitle2': subtitle2,
      'tip': tip,
      'title': title,
    };
  }
}
