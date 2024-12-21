import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingStandardsVulnurable {
  final List<String> points;
  final List<String> points1;
  final String title;
  final String title1;
  final String title2;

  MeetingStandardsVulnurable({
    required this.points,
    required this.points1,
    required this.title,
    required this.title1,
    required this.title2,
  });

  // Factory constructor to convert Firestore data to model
  factory MeetingStandardsVulnurable.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return MeetingStandardsVulnurable(
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
    );
  }
}
