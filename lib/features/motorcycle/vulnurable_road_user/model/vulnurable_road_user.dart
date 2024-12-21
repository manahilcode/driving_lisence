import 'package:cloud_firestore/cloud_firestore.dart';

class VulnerableRoadUser12 {
  final List<String> points;
  final String subtitle;
  final String subtitle1;
  final String title;

  VulnerableRoadUser12({
    required this.points,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
  });

  // Factory constructor to convert Firestore data to model
  factory VulnerableRoadUser12.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return VulnerableRoadUser12(
      points: List<String>.from(data['points'] ?? []),
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
