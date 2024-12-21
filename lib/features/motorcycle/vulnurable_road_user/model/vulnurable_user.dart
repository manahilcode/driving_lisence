import 'package:cloud_firestore/cloud_firestore.dart';

class VulnerableRoadUsersVal {
  final List<String> points;
  final String title;
  final String subtitle;

  VulnerableRoadUsersVal({
    required this.points,
    required this.title,
    required this.subtitle,
  });

  // Factory constructor to convert Firestore data to model
  factory VulnerableRoadUsersVal.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return VulnerableRoadUsersVal(
      points: List<String>.from(data['points'] ?? []),
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
    );
  }
}
