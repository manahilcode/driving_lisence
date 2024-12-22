import 'package:cloud_firestore/cloud_firestore.dart';

class RidingAtNight {
  final List<String> answer;
  final String correct;
  final String image;
  final String info;
  final List<String> points;
  final String question;
  final String subtitle;
  final String subtitle1;
  final String title;

  RidingAtNight({
    required this.answer,
    required this.correct,
    required this.image,
    required this.info,
    required this.points,
    required this.question,
    required this.subtitle,
    required this.subtitle1,
    required this.title,
  });

  factory RidingAtNight.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return RidingAtNight(
      answer: List<String>.from(data['answer'] ?? []),
      correct: data['correct'] ?? '',
      image: data['image'] ?? '',
      info: data['info'] ?? '',
      points: List<String>.from(data['points'] ?? []),
      question: data['question'] ?? '',
      subtitle: data['subtitle'] ?? '',
      subtitle1: data['subtitle1'] ?? '',
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
      'question': question,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
      'title': title,
    };
  }
}
