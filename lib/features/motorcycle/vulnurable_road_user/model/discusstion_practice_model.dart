import 'package:cloud_firestore/cloud_firestore.dart';

class DiscussionPracticeVal {
  final List<String> points;
  final List<String> points1;
  final String subtitle;
  final String title;
  final String title1;
  final String title2;

  DiscussionPracticeVal({
    required this.points,
    required this.points1,
    required this.subtitle,
    required this.title,
    required this.title1,
    required this.title2,
  });

  // Factory constructor to convert Firestore data to model
  factory DiscussionPracticeVal.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return DiscussionPracticeVal(
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      subtitle: data['subtitle'] ?? '',
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
    );
  }
}
