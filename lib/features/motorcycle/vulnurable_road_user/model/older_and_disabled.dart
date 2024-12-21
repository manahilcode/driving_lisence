import 'package:cloud_firestore/cloud_firestore.dart';

class OlderAndDisabledPedestrians {
  final List<String> answer;
  final String correct;
  final String info;
  final String question;
  final String subtitle;
  final String subtitle1;
  final String title;

  OlderAndDisabledPedestrians({
    required this.answer,
    required this.correct,
    required this.info,
    required this.question,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
  });

  // Factory constructor to convert Firestore data to model
  factory OlderAndDisabledPedestrians.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return OlderAndDisabledPedestrians(
      answer: List<String>.from(data['answer'] ?? []),
      correct: data['correct'] ?? '',
      info: data['info'] ?? '',
      question: data['question'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
