import 'package:cloud_firestore/cloud_firestore.dart';

class ThinkAboutHandling {
  final List<String> points;
  final String title;

  ThinkAboutHandling({
    required this.points,
    required this.title,
  });

  factory ThinkAboutHandling.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ThinkAboutHandling(
      points: List<String>.from(data['points'] ?? []),
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'title': title,
    };
  }
}
