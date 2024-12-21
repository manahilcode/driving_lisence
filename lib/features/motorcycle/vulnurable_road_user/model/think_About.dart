import 'package:cloud_firestore/cloud_firestore.dart';

class DiscussionQuestionsval {
  final List<String> points;
  final String title;

  DiscussionQuestionsval({
    required this.points,
    required this.title,
  });

  // Factory constructor to convert Firestore data to model
  factory DiscussionQuestionsval.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return DiscussionQuestionsval(
      points: List<String>.from(data['points'] ?? []),
      title: data['title'] ?? '',
    );
  }
}
