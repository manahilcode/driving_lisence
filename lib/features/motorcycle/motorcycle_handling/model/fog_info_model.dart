import 'package:cloud_firestore/cloud_firestore.dart';

class FogInfo {
  final List<String> answer;
  final String correct;
  final String image;
  final String info;
  final List<String> points;
  final List<String> points1;
  final String question;
  final String subtitle;
  final String tip;
  final String title;

  FogInfo({
    required this.answer,
    required this.correct,
    required this.image,
    required this.info,
    required this.points,
    required this.points1,
    required this.question,
    required this.subtitle,
    required this.tip,
    required this.title,
  });

  factory FogInfo.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return FogInfo(
      answer: List<String>.from(data['answer'] ?? []),
      correct: data['correct'] ?? '',
      image: data['image'] ?? '',
      info: data['info'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      points1: List<String>.from(data['points1'] ?? []),
      question: data['question'] ?? '',
      subtitle: data['subtitle'] ?? '',
      tip: data['tip'] ?? '',
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'correct': correct,
      'image': image,
      'info': info,
      'points': points,
      'points1': points1,
      'question': question,
      'subtitle': subtitle,
      'tip': tip,
      'title': title,
    };
  }
}
