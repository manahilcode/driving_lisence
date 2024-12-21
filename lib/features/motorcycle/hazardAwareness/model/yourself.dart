import 'package:cloud_firestore/cloud_firestore.dart';

class AwarenessHazardYourself {
  final List<String> points;
  final List<String> points1;
  final String title;
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final String title5;
  final String title6;
  final String subtitle;
  final String subtitle1;
  final String subtitle2;
  final String subtitle4;
  final String subtitle5;
  final String subtitle6;

  AwarenessHazardYourself({
    required this.points,
    required this.points1,
    required this.title,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.title5,
    required this.title6,
    required this.subtitle,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle4,
    required this.subtitle5,
    required this.subtitle6,
  });

  // Factory constructor to convert Firestore data to model
  factory AwarenessHazardYourself.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return AwarenessHazardYourself(
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      title: data['title'] ?? '',
      title1: data['title1'] ?? '',
      title2: data['title2'] ?? '',
      title3: data['title3'] ?? '',
      title4: data['title4'] ?? '',
      title5: data['title5'] ?? '',
      title6: data['title6'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      subtitle2: data['subtitle2'] ?? '',
      subtitle4: data['subtitle4'] ?? '',
      subtitle5: data['subtitle5'] ?? '',
      subtitle6: data['subtitle6'] ?? '',
    );
  }
}
