import 'package:cloud_firestore/cloud_firestore.dart';

class ThinkAboutInfoOtherType {
  final List<String> points;
  final String title;

  ThinkAboutInfoOtherType({
    required this.points,
    required this.title,
  });

  factory ThinkAboutInfoOtherType.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ThinkAboutInfoOtherType(
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
