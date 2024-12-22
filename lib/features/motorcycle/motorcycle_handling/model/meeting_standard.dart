import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingStandardsInfoHandling {
  final List<String> points;
  final String title;
  final String title1;
  final String title2;

  MeetingStandardsInfoHandling({
    required this.points,
    required this.title,
    required this.title1,
    required this.title2,
  });

  factory MeetingStandardsInfoHandling.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MeetingStandardsInfoHandling(
      points: List<String>.from(data['points'] ?? []),
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'title': title,
      'title1': title1,
      'title2': title2,
    };
  }
}
