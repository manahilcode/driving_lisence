import 'package:cloud_firestore/cloud_firestore.dart';

class TrainerDiscussionPracticeHandling {
  final List<String> points;
  final List<String> points1;
  final String subtitle;
  final String title;
  final String title1;
  final String title2;

  TrainerDiscussionPracticeHandling({
    required this.points,
    required this.points1,
    required this.subtitle,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory TrainerDiscussionPracticeHandling.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return TrainerDiscussionPracticeHandling(
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      subtitle: data['subtitle'] ?? '',
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'points1': points1,
      'subtitle': subtitle,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
